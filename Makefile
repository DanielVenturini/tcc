ROOT = main
BIBTEX = $(ROOT)
PDFLATEX_ARGS = -file-line-error -interaction nonstopmode -recorder --src-specials
LATEXRTF = latex2rtf
LATEXRTF_ARGS = -i brazil

all: clean pdf

distclean: clean
	rm -f  *.pdf

check:
	chktex -n 2 -n 8 -n 6 -n 38 -n 13 -n 36 -n 24 $(ROOT)
	bibclean $(BIBTEX) > /dev/null

clean:
	rm -f *~ *.log *.aux *.toc *.dvi *.bbl *.blg *.*~* *.lof *.lot *.cb *.backup *.out *.glo *.idx *.fls *.lol *.ilg *.gls *.bcf

cleanAll: clean
	rm -f $(ROOT).pdf

pdf:
	pdflatex $(PDFLATEX_ARGS) $(ROOT)
	-bibtex -min-crossrefs=60 $(ROOT)
#	iconv --from-code=ISO-8859-1 --to-code=UTF-8 $(ROOT).bbl > $(ROOT).bbl.new
#	mv $(ROOT).bbl.new $(ROOT).bbl
	pdflatex $(PDFLATEX_ARGS) $(ROOT)
	pdflatex $(PDFLATEX_ARGS) $(ROOT)
	pdflatex $(PDFLATEX_ARGS) $(ROOT)

rtf:
	$(LATEXRTF) $(LATEXRTF_ARGS) $(ROOT)



