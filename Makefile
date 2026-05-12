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

# this is for testing, it will only build the EN version of the docs
livehtml: autogenerate
	sphinx-autobuild --open-browser --host 0.0.0.0 -b dirhtml "$(SOURCEDIR)" "$(BUILDDIR)/html"

# this will update `arguments.rst` to match arguments in the ODM code
# add any individual file for an argument missing from `source/arguments_edit/`
# update the files in `source/arguments/` including adding in
# all user contributed content from files in `source/arguments_edit/`
autogenerate:
	python scripts/extract_odm_strings.py https://raw.githubusercontent.com/OpenDroneMap/ODM/master/opendm/config.py
	@$(SPHINXBUILD) -b gettext "$(SOURCEDIR)" "source/locale/pot"
	sphinx-intl update --pot-dir "source/locale/pot" --language ar,cs,es,fil,fr,id,sw,te,zh
	@$(MAKE) cleanobsolete

# update main EN pot files that serve as the source for translation process
updatepot:
	@$(SPHINXBUILD) -b gettext "$(SOURCEDIR)" "source/locale/pot"

# update the po files for each target language from the EN pot files
updatelangpo:
	sphinx-intl update --pot-dir "source/locale/pot" --language ar,cs,es,fil,fr,id,sw,te,zh
	@$(MAKE) cleanobsolete

# remove obsolete entries from all .po files
cleanobsolete:
	@echo "Removing obsolete entries from .po files..."
	@for lang in ar cs es fil fr id sw te zh; do \
		for po in source/locale/$$lang/LC_MESSAGES/*.po source/locale/$$lang/LC_MESSAGES/*/*.po; do \
			if [ -f "$$po" ]; then \
				msgattrib --no-obsolete --no-fuzzy -o "$$po.tmp" "$$po" 2>/dev/null && mv "$$po.tmp" "$$po" || rm -f "$$po.tmp"; \
			fi; \
		done; \
	done
	@echo "Done cleaning obsolete entries."

# push new and changed strings to Transifex
pushlang:
	tx push --source

# push translated strings from Transifex
pulllang:
	tx pull --language "ar,cs,es,fil,fr,id,sw,te,zh"

build:
	@$(SPHINXBUILD) -b dirhtml "$(SOURCEDIR)" "$(BUILDDIR)/html" -nW
	@$(SPHINXBUILD) -b dirhtml -D language='cs' "$(SOURCEDIR)" "$(BUILDDIR)/html/cs" -nW
	@$(SPHINXBUILD) -b dirhtml -D language='es' "$(SOURCEDIR)" "$(BUILDDIR)/html/es" -nW
	@$(SPHINXBUILD) -b dirhtml -D language='fil' "$(SOURCEDIR)" "$(BUILDDIR)/html/fil"  -nW
	@$(SPHINXBUILD) -b dirhtml -D language='fr' "$(SOURCEDIR)" "$(BUILDDIR)/html/fr" -nW
	@$(SPHINXBUILD) -b dirhtml -D language='id' "$(SOURCEDIR)" "$(BUILDDIR)/html/id"  -nW
	@$(SPHINXBUILD) -b dirhtml -D language='sw' "$(SOURCEDIR)" "$(BUILDDIR)/html/sw" -nW
	@$(SPHINXBUILD) -b dirhtml -D language='te' "$(SOURCEDIR)" "$(BUILDDIR)/html/te" -nW
	@$(SPHINXBUILD) -b dirhtml -D language='zh' "$(SOURCEDIR)" "$(BUILDDIR)/html/zh" -nW
	#  -n   Run in nit-picky mode. Currently, this generates warnings for all missing references.
	#  -W   Turn warnings into errors that stop the build.
	# for more details about the options see https://www.sphinx-doc.org/en/1.8/man/sphinx-build.html#options

# `allerr` runs without nit-picky mode, so that an error doesn't halt the build
# it will log all errors that need to be fixed in the translations (generally syntax errors)
allerr:
	@$(SPHINXBUILD) -v -b dirhtml "$(SOURCEDIR)" "$(BUILDDIR)/html"
	@$(SPHINXBUILD) -v -b dirhtml -D language='cs' "$(SOURCEDIR)" "$(BUILDDIR)/html/cs"
	@$(SPHINXBUILD) -v -b dirhtml -D language='es' "$(SOURCEDIR)" "$(BUILDDIR)/html/es"
	@$(SPHINXBUILD) -v -b dirhtml -D language='fil' "$(SOURCEDIR)" "$(BUILDDIR)/html/fil"
	@$(SPHINXBUILD) -v -b dirhtml -D language='fr' "$(SOURCEDIR)" "$(BUILDDIR)/html/fr"
	@$(SPHINXBUILD) -v -b dirhtml -D language='id' "$(SOURCEDIR)" "$(BUILDDIR)/html/id"
	@$(SPHINXBUILD) -v -b dirhtml -D language='sw' "$(SOURCEDIR)" "$(BUILDDIR)/html/sw"
	@$(SPHINXBUILD) -v -b dirhtml -D language='te' "$(SOURCEDIR)" "$(BUILDDIR)/html/te"
	@$(SPHINXBUILD) -v -b dirhtml -D language='zh' "$(SOURCEDIR)" "$(BUILDDIR)/html/zh"

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
