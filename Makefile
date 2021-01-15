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

update: autogenerate
	sphinx-build -b gettext source source/locale/en/pot
	tx push --source
	tx pull --use-git-timestamps -l "sw,ar,es,fr,te,fil"
	make allerr

livehtml:
	sphinx-autobuild --open-browser -H 0.0.0.0 -b html "$(SOURCEDIR)" "$(BUILDDIR)"

production:
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)/html" -nW
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)/html/sw" -D language='sw' -nW 
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)/html/ar" -D language='ar' -nW 
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)/html/es" -D language='es' -nW
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)/html/fr" -D language='fr' -nW
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)/html/te" -D language='te' -nW
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)/html/fil" -D language='fil' -nW
	#  -n   Run in nit-picky mode. Currently, this generates warnings for all missing references.
	#  -W   Turn warnings into errors that stop the build.
	# for more details about the options see https://www.sphinx-doc.org/en/1.8/man/sphinx-build.html#options

# `allerr` runs without nit-picky mode, so that an error doesn't halt the build
# it will log all errors that need to be fixed in the translations (generally syntax errors)
allerr:
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)/html"
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)/html/sw" -D language='sw' 
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)/html/ar" -D language='ar' 
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)/html/es" -D language='es'
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)/html/fr" -D language='fr'
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)/html/te" -D language='te'
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)/html/fil" -D language='fil'

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
