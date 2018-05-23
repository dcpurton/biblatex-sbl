# Makefile to create zip file for CTAN upload

CTANDIR = biblatex-sbl
TDSDIR = biblatex-sbl.tds
TDSDOCDIR = $(TDSDIR)/doc/latex/biblatex-sbl
TDSTEXDIR = $(TDSDIR)/tex/latex/biblatex-sbl
TDSISTDIR = $(TDSDIR)/makeindex/biblatex-sbl
TEXMFHOME = $(shell kpsewhich -var-value=TEXMFHOME)

README   = README.md
ISTFILES = doc/sbl-paper-bibleref.ist
DOCFILES = doc/biblatex-sbl.bib \
	   doc/biblatex-sbl.pdf \
	   doc/biblatex-sbl.tex \
	   doc/biblatex-sbl-ibid.pdf \
	   doc/biblatex-sbl-ibid.tex \
	   doc/biblatex-sbl-examples.pdf \
	   doc/biblatex-sbl-examples.tex \
	   doc/sbl-paper.pdf \
	   doc/sbl-paper.tex
TEXFILES = doc/sbl-paper.sty \
	   latex/biblatex-sbl.def \
	   latex/sbl.bbx \
	   latex/sbl.cbx \
	   latex/sbl.dbx \
	   latex/american-sbl.lbx \
	   latex/english-sbl.lbx \
	   latex/german-sbl.lbx \
	   latex/spanish-sbl.lbx
TDSZIP   = biblatex-sbl.tds.zip
CTANZIP  = biblatex-sbl.zip

BIBLATEX-SBL-VERSION = $(shell grep def.sbl@abx@version latex/biblatex-sbl.def | awk -vRS='}' -vFS='{' '{print $$2}')
BIBLATEX-SBL-DATE = $(shell grep def.sbl@abx@date latex/biblatex-sbl.def | awk -vRS='}' -vFS='{' '{print $$2}' | sed -r 's/\//-/g')
BIBLATEX-SBL-COPYRIGHT = $(shell grep Copyright README.md)
SBL-PAPER-DATE = $(shell grep Society.of.Bibilical.Literature.Paper.Style doc/sbl-paper.sty | awk -vRS=']' -vFS='[' '{print $$2}' | awk '{print $$1}')
SBL-PAPER-COPYRIGHT = $(shell grep Copyright doc/sbl-paper.sty | sed -r 's/^.//')

SBL-PAPER-DATE-CHECK = $(shell git log -1 --format=%cd --date=short doc/sbl-paper.sty)

help:
	@echo "Make options:"
	@echo "\tmake install:   Install the package into your local tex tree"
	@echo "\tmake uninstall: Uninstall the package from your local tex tree"
	@echo "\tmake doc:       Build the package documentation"
	@echo "\tmake test:      Run some basic tests on the package"
	@echo "\tmake ctancheck: Run some basic tests before uploading to CTAN"
	@echo "\tmake ctanzip:   Build a zipfile for upload to CTAN"
	@echo "\tmake tdszip:    Build a TeX Document Structure zipfile"
	@echo "\tmake clean:     Clean the source tree"

ctanzip: $(CTANZIP)

tdszip: $(TDSZIP)

$(CTANZIP):
	rm -rf $(CTANZIP) $(CTANDIR)
	mkdir -p $(CTANDIR)
	cp $(README) $(CTANDIR)
	cp $(ISTFILES) $(CTANDIR)
	cp $(DOCFILES) $(CTANDIR)
	cp $(TEXFILES) $(CTANDIR)
	zip -r $(CTANZIP) $(CTANDIR)
	rm -rf $(CTANDIR)

$(TDSZIP):
	rm -rf $(TDSZIP) $(TDSDIR)
	mkdir -p $(TDSDOCDIR)
	mkdir -p $(TDSTEXDIR)
	mkdir -p $(TDSISTDIR)
	cp $(ISTFILES) $(TDSISTDIR)
	cp $(README) $(DOCFILES) $(TDSDOCDIR)
	cp $(TEXFILES) $(TDSTEXDIR)
	cd $(TDSDIR) && zip -r $(TDSZIP) *
	mv $(TDSDIR)/$(TDSZIP) .
	rm -rf $(TDSDIR)

.PHONY: doc test doctest ctancheck clean docclean testclean install uninstall

install: uninstall
	mkdir -p $(TEXMFHOME)/doc/latex/biblatex-sbl
	mkdir -p $(TEXMFHOME)/tex/latex/biblatex-sbl
	mkdir -p $(TEXMFHOME)/makeindex/biblatex-sbl
	cp $(ISTFILES) $(TEXMFHOME)/makeindex/biblatex-sbl
	cp $(README) $(DOCFILES) $(TEXMFHOME)/doc/latex/biblatex-sbl
	cp $(TEXFILES) $(TEXMFHOME)/tex/latex/biblatex-sbl

uninstall:
	rm -rf $(TEXMFHOME)/doc/latex/biblatex-sbl
	rm -rf $(TEXMFHOME)/tex/latex/biblatex-sbl
	rm -rf $(TEXMFHOME)/makeindex/biblatex-sbl

doc:
	@cd doc && make doc

test: doctest
	@cd test && make test

doctest:
	@cd doc && make test

ctancheck:
	@echo "CTAN upload info:"
	@echo "\tName: biblatex-sbl"
	@echo "\tVersion: $(BIBLATEX-SBL-VERSION) $(BIBLATEX-SBL-DATE)"
	@echo "\tAuthor: David Purton"
	@echo "\tEmail: dcpurton@marshwiggle.net"
	@echo "\tSummary: Society of Biblical Literature (SBL) style files for BibLaTeX"
	@echo "\tCTAN directory: /macros/latex/contrib/biblatex-contrib/biblatex-sbl"
	@echo "\tType of Upload: Update (with announcement)"
	@echo "\tLicense type: license type: LaTeX Public Project License (version 1.3)"
	@echo "\nOther Checks:"
	@echo "\tsbl-paper.sty date: $(SBL-PAPER-DATE)"
	@echo "\tsbl-paper.sty last change: $(SBL-PAPER-DATE-CHECK)"
	@echo "\tbiblatex-sbl copyright: $(BIBLATEX-SBL-COPYRIGHT)"
	@echo "\tsbl-paper.sty copyright: $(SBL-PAPER-COPYRIGHT)"

clean: testclean docclean
	@rm -rf $(TDSZIP) $(CTANZIP) $(CTANDIR) $(TDSDIR)
	@echo "Cleaning CTAN and TDS zip files"

docclean:
	@cd doc && make clean

testclean:
	@cd test && make clean
