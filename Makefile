# Makefile to create zip file for CTAN upload

CTANDIR = biblatex-sbl
TDSDIR = biblatex-sbl.tds
TDSDOCDIR = $(TDSDIR)/doc/latex/biblatex-sbl
TDSTEXDIR = $(TDSDIR)/tex/latex/biblatex-sbl
TDSISTDIR = $(TDSDIR)/makeindex/biblatex-sbl

README   = README.md
ISTFILES = doc/sbl-paper-bibleref.ist
DOCFILES = doc/biblatex-sbl.bib \
	   doc/biblatex-sbl.pdf \
	   doc/biblatex-sbl.tex \
	   doc/biblatex-sbl-ibid.pdf \
	   doc/biblatex-sbl-ibid.tex \
	   doc/biblatex-sbl-test.pdf \
	   doc/biblatex-sbl-test.tex \
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

clean:
	rm -rf $(TDSZIP) $(CTANZIP) $(CTANDIR) $(TDSDIR)
