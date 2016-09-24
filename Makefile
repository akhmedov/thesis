COMPILER = pdflatex --interaction nonstopmode
BIBEL = bibtex

.PHONY: clean install

default: *.tex my.bib import.bib
	$(COMPILER) thesis.tex; \
	$(BIBEL) thesis.aux; \
	$(COMPILER) thesis.tex

clean:
	@rm -f *.dtx *.ins 
	@rm -f *.toc *.blg *.bbl
	@rm -f *.aux *.pdf *.log
