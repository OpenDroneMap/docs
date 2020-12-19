#!/usr/bin/python3

import argparse, os, urllib.request, ast, sys
from io import StringIO
from string import Template

parser = argparse.ArgumentParser(description='Extract ODM strings.')
parser.add_argument('input', type=str,
                    help='URL to ODM\'s config.py')
parser.add_argument('template', type=str,
                    help='Template rst to use')
parser.add_argument('output', type=str,
                    help='Where to write resulting rst file')
args = parser.parse_args()

url = args.input
outfile = args.output
tmplfile = args.template

strings = []
print("Fetching %s ..." % url)
res = urllib.request.urlopen(url)
config_file = res.read().decode('utf-8')
# config_file = open("test.py").read()

options = {}
args_map = {}
class ArgumentParserStub(argparse.ArgumentParser):
    def add_argument(self, *args, **kwargs):
        argparse.ArgumentParser.add_argument(self, *args, **kwargs)
        options[args[0]] = {}
        args_map[args[0]] = args[1:]

        for name, value in kwargs.items():
            options[args[0]][str(name)] = str(value)
    
    def add_mutually_exclusive_group(self):
        return ArgumentParserStub()

# Voodoo! :)
# ( parse AST, extract "def config()" function, set module to only
# contain that function, execute module in current scope, 
# run config function)
root = ast.parse(config_file)
new_body = []
for stmt in root.body:
    # Assignments
    if hasattr(stmt, 'targets'):
        new_body.append(stmt)

    # Functions
    elif hasattr(stmt, 'name'):
        new_body.append(stmt)

root.body = new_body
exec(compile(root, filename="<ast>", mode="exec"))


# Misc variables needed to get config to run
__version__ = '?'
class context:    
    root_path = ''
    num_cores = 4
class io:
    def path_or_json_string_to_dict(s):
        return s
def path_or_json_string(s):
    return s
class log:
    def ODM_ERROR(s):
        pass

config(["--project-path", "/bogus", "name"], parser=ArgumentParserStub())
for opt in options:
    h = options[opt].get('help')
    if h:
        h = h.replace("\n", "")
        h = h.replace('%(default)s', '``' + options[opt].get('default', '') + '``')
        h = h.replace('%(choices)s', options[opt].get('choices', ''))
        options[opt]['help'] = h
    else:
        options[opt]['help'] = ''

print("Found %s ODM options" % len(options))

if len(options) > 0:
    subst = ""

    keys = list(options.keys())
    keys.sort(key=lambda a: a.replace("-", ""))

    for opt in keys:
        subst += "``%s%s`` %s\n  %s\n\n" % (
            opt,
            "," + ",".join(args_map[opt]) if len(args_map[opt]) > 0 else "",
            options[opt].get('metavar', ''),
            options[opt].get('help', '')
        )

    with open(tmplfile) as f:
        tmpl = Template(f.read())


    with open(outfile, "w") as f:
        f.write(tmpl.substitute(arguments=subst))

    print("Wrote %s" % outfile)
else:
    print("No strings found")