# makefile for Sphinx documentation
# =================================

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SPHINXPROJ    = OpenDroneMap
SOURCEDIR     = source
BUILDDIR      = _build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# this will update `arguments.rst` to match arguments in the ODM code
autogenerate:
	python scripts/extract_odm_strings.py https://raw.githubusercontent.com/OpenDroneMap/ODM/master/opendm/config.py scripts/arguments.template.rst source/arguments.rst

pushlang: 
	@$(SPHINXBUILD) -b gettext "$(SOURCEDIR)" "source/locale/en/pot"
	tx push --source
pulllang:	
	tx pull --language "sw,ar,es,fr,te,fil"

livehtml:
	sphinx-autobuild --open-browser -H 0.0.0.0 -b dirhtml "$(SOURCEDIR)" "$(BUILDDIR)"

export GIT_DEPLOY_DIR = _build/html
export GIT_DEPLOY_BRANCH = gh-pages
deploy:
	@$(SPHINXBUILD) -b dirhtml "$(SOURCEDIR)" "$(BUILDDIR)/html" -nW
	@$(SPHINXBUILD) -b dirhtml -D language='sw' "$(SOURCEDIR)" "$(BUILDDIR)/html/sw" -nW 
	@$(SPHINXBUILD) -b dirhtml -D language='ar' "$(SOURCEDIR)" "$(BUILDDIR)/html/ar" -nW 
	@$(SPHINXBUILD) -b dirhtml -D language='es' "$(SOURCEDIR)" "$(BUILDDIR)/html/es" -nW
	@$(SPHINXBUILD) -b dirhtml -D language='fr' "$(SOURCEDIR)" "$(BUILDDIR)/html/fr" -nW
	@$(SPHINXBUILD) -b dirhtml -D language='te' "$(SOURCEDIR)" "$(BUILDDIR)/html/te" -nW
	@$(SPHINXBUILD) -b dirhtml -D language='fil' "$(SOURCEDIR)" "$(BUILDDIR)/html/fil"  -nW
	#  -n   Run in nit-picky mode. Currently, this generates warnings for all missing references.
	#  -W   Turn warnings into errors that stop the build.
	# for more details about the options see https://www.sphinx-doc.org/en/1.8/man/sphinx-build.html#options
	echo "docs.opendronemap.org" > ./_build/html/CNAME
	chmod +x ./scripts/deploy.sh
	./scripts/deploy.sh

# `allerr` runs without nit-picky mode, so that an error doesn't halt the build
# it will log all errors that need to be fixed in the translations (generally syntax errors)
allerr:
	@$(SPHINXBUILD) -b dirhtml "$(SOURCEDIR)" "$(BUILDDIR)/html"
	@$(SPHINXBUILD) -b dirhtml -D language='sw' "$(SOURCEDIR)" "$(BUILDDIR)/html/sw"  
	@$(SPHINXBUILD) -b dirhtml -D language='ar' "$(SOURCEDIR)" "$(BUILDDIR)/html/ar"  
	@$(SPHINXBUILD) -b dirhtml -D language='es' "$(SOURCEDIR)" "$(BUILDDIR)/html/es" 
	@$(SPHINXBUILD) -b dirhtml -D language='fr' "$(SOURCEDIR)" "$(BUILDDIR)/html/fr" 
	@$(SPHINXBUILD) -b dirhtml -D language='te' "$(SOURCEDIR)" "$(BUILDDIR)/html/te" 
	@$(SPHINXBUILD) -b dirhtml -D language='fil' "$(SOURCEDIR)" "$(BUILDDIR)/html/fil" 

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
