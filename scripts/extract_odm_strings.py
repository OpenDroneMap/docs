#!/usr/bin/python3

import argparse, os, urllib.request, ast, sys, glob
from io import StringIO
from pathlib import Path
from string import Template

parser = argparse.ArgumentParser(description='Extract ODM strings.')
# https://raw.githubusercontent.com/OpenDroneMap/ODM/master/opendm/config.py
parser.add_argument('input', type=str,
                    help='URL to ODM\'s config.py')
args = parser.parse_args()

url = args.input
outfile = os.path.join(os.path.dirname(__file__), "..", "source", "arguments.rst")
tmplfile = os.path.join(os.path.dirname(__file__), "arguments.template.rst")
argstmplfile = os.path.join(os.path.dirname(__file__), "arguments.arg.template.rst")
argsoutdir = os.path.join(os.path.dirname(__file__), "..", "source", "arguments")
argspotdir = os.path.join(os.path.dirname(__file__), "..", "source", "locale", "pot", "arguments")
localedir = os.path.join(os.path.dirname(__file__), "..", "source", "locale")
txconfigfile = os.path.join(os.path.dirname(__file__), "..", ".tx", "config")

# List of supported languages (should match Makefile)
LANGUAGES = ['ar', 'cs', 'es', 'fil', 'fr', 'id', 'sw', 'te', 'zh']

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
        h = h.replace('%(default)s', ('``' + options[opt].get('default', '') + '``').replace('````', '``'))
        h = h.replace("Can be one of: %(choices)s", "")
        h = h.replace("Can be one of: %(choices)s.", "")
        h = h.replace('%(choices)s', options[opt].get('choices', ''))
        options[opt]['help'] = h
    else:
        options[opt]['help'] = ''

print("Found %s ODM options" % len(options))

if len(options) > 0:
    subst = ""

    keys = list(options.keys())
    keys.sort(key=lambda a: a.replace("-", ""))

    # Clean up the output directory - remove all existing .rst files
    print("Cleaning up %s ..." % argsoutdir)
    for old_file in glob.glob(os.path.join(argsoutdir, "*.rst")):
        os.remove(old_file)

    # Clean up old .pot files for deprecated arguments
    if os.path.isdir(argspotdir):
        print("Cleaning up %s ..." % argspotdir)
        for old_pot in glob.glob(os.path.join(argspotdir, "*.pot")):
            os.remove(old_pot)
            print("Removed %s" % old_pot)

    # Clean up old .po files for deprecated arguments in all languages
    for lang in LANGUAGES:
        argspodir = os.path.join(localedir, lang, "LC_MESSAGES", "arguments")
        if os.path.isdir(argspodir):
            print("Cleaning up %s ..." % argspodir)
            for old_po in glob.glob(os.path.join(argspodir, "*.po")):
                os.remove(old_po)
                print("Removed %s" % old_po)
        print("Removed %s" % old_file)

    with open(argstmplfile) as f:
        argstmpl = Template(f.read())

    def get_opt_name(opt):
        opt_name = opt
        arg_map = args_map[opt]
        if len(arg_map) > 0:
            # Use longest name
            opt_name = max(arg_map + (opt_name, ), key=len)
        return opt_name.replace("--", "")

    def get_opt_descr(opt):
        return options[opt].get('help', '').replace("*", "\*")

    def get_opt_choices(opt):
        return options[opt].get('choices', options[opt].get('metavar', '')).replace('[', '').replace(']', '').replace(',', ' | ').replace('\'', '')

    for opt in keys:
        opt_name = get_opt_name(opt)

        include_file = os.path.join(argsoutdir + "_edit", "%s.rst" % opt_name)
        if not os.path.isfile(include_file):
            with open(include_file, 'w') as f:
                f.write("\n")
            print("Wrote %s" % include_file)

        argument_edit = Path(include_file).read_text(encoding='utf-8')

        kwargs = {
            'opt': opt_name,
            'ticks': '`' * len(opt_name),
            'descr': get_opt_descr(opt),
            'parameter': "**Options:** *%s*" % get_opt_choices(opt) if get_opt_choices(opt) else "",
            'include': argument_edit,
            'editfile': os.path.join("arguments_edit", os.path.basename(include_file)),
        }

        argsoutfile = os.path.join(argsoutdir, opt_name + ".rst")
        with open(argsoutfile, "w") as f:
            f.write(argstmpl.substitute(**kwargs))
        print("Wrote %s" % argsoutfile)

    for opt in keys:
        subst += ":ref:`%s<%s>` %s\n  %s\n\n" % (
            get_opt_name(opt),
            get_opt_name(opt),
            get_opt_choices(opt),
            get_opt_descr(opt)
        )

    with open(tmplfile) as f:
        tmpl = Template(f.read())


    with open(outfile, "w") as f:
        f.write(tmpl.substitute(arguments=subst))

    print("Wrote %s" % outfile)

    # Update .tx/config to remove deprecated options
    if os.path.isfile(txconfigfile):
        print("Updating %s ..." % txconfigfile)
        with open(txconfigfile, 'r') as f:
            config_lines = f.readlines()

        # Get list of current options
        current_opts = set(get_opt_name(opt) for opt in keys)

        # Parse and filter .tx/config
        new_config_lines = []
        skip_section = False
        i = 0
        while i < len(config_lines):
            line = config_lines[i]

            # Check if this is an arguments section header
            if line.startswith('[o:americanredcross:p:opendronemap_docs:r:arguments_'):
                # Extract option name
                section_name = line.strip()[1:-1]  # Remove [ and ]
                opt_name = section_name.split(':')[-1].replace('arguments_', '')

                # Check if this option still exists
                if opt_name not in current_opts:
                    print("Removing deprecated section: %s" % opt_name)
                    skip_section = True
                    # Skip this section header and all lines until next section or EOF
                    i += 1
                    while i < len(config_lines) and not config_lines[i].startswith('['):
                        i += 1
                    continue
                else:
                    skip_section = False

            if not skip_section:
                new_config_lines.append(line)

            i += 1

        # Write updated config
        with open(txconfigfile, 'w') as f:
            f.writelines(new_config_lines)
        print("Updated %s" % txconfigfile)

else:
    print("No strings found")
