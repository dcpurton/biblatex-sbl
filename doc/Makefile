TEMP-EXTENSIONS=.pdf .txt .aux .bbl .bcf .blg .idx .ilg .ind .log .out .run.xml .toc
LUALATEX=lualatex -interaction=batchmode
BIBER=biber -q -q
CMP=cmp --silent

export TEXINPUTS := ../latex/:$(TEXINPUTS):

TEST-PASS='\e[1;32m[PASS]\e[0m'
TEST-FAIL='\e[1;31m[FAIL]\e[0m'

DEPS=../latex/biblatex-sbl.def \
     ../latex/sbl.cbx \
     ../latex/sbl.bbx \
     ../latex/sbl.dbx \
     ../latex/american-sbl.lbx \
     ../latex/english-sbl.lbx \
     biblatex-sbl.bib

PDFS=biblatex-sbl-ibid.pdf \
     biblatex-sbl.pdf \
     biblatex-sbl-examples.pdf \
     sbl-paper.pdf

TXTS=biblatex-sbl-ibid.txt \
     biblatex-sbl.txt \
     biblatex-sbl-examples.txt \
     sbl-paper.txt

.PRECIOUS: %.bcf %.bbl

.PHONY: doc test clean

doc: $(PDFS)

test: $(TXTS)

%.bcf: %.tex $(DEPS)
	@echo -n "Building $< (first pass) ... "
	@$(LUALATEX) $< > /dev/null
	@echo "Done."

sbl-paper.bcf: sbl-paper.tex $(DEPS) sbl-paper.sty sbl-paper-bibleref.ist
	@echo -n "Building $< (first pass) ... "
	@$(LUALATEX) $< > /dev/null
	@echo "Done."

%.bbl: %.bcf
	@echo -n "Running Biber on $< ... "
	@$(BIBER) $<
	@touch $@
	@echo "Done."

%.pdf: %.bbl
	@echo -n "Building $(basename $<).tex (second pass) ... "
	@$(LUALATEX) $(basename $<).tex > /dev/null
	@echo "Done."
	@echo -n "Building $(basename $<).tex (third pass) ... "
	@$(LUALATEX) $(basename $<).tex > /dev/null
	@touch $(basename $@).bcf
	@touch $(basename $@).bbl
	@touch $@
	@echo "Done."

%.txt: %.pdf
	@echo -n "Testing $(basename $<).tex ... "
	@pdftotext $<
	@$(CMP) $@ ../test/$(basename $@).ref.txt && /bin/echo -e $(TEST-PASS) || /bin/echo -e $(TEST-FAIL)
	@$(CMP) $@ ../test/$(basename $@).ref.txt && git checkout $< || echo -n ""
	@rm $@

clean:
	@echo -n "Cleaning doc temporary files ... "
	@rm -f $(addprefix biblatex-sbl, $(TEMP-EXTENSIONS))
	@rm -f $(addprefix biblatex-sbl-examples, $(TEMP-EXTENSIONS))
	@rm -f $(addprefix biblatex-sbl-ibid, $(TEMP-EXTENSIONS))
	@rm -f $(addprefix sbl-paper, $(TEMP-EXTENSIONS))
	@rm -f sbl-paper-aut.* sbl-paper-scr.*
	@echo "Done."
