COMPILER = pdflatex --interaction nonstopmode
BIBEL = bibtex

.PHONY: clean log

default: *.tex *.bib
	$(COMPILER) thesis.tex; \
	$(BIBEL) thesis.aux; \
	$(COMPILER) thesis.tex

log:
	git log --oneline --decorate --graph

clean:
	@rm -f *.dtx *.ins 
	@rm -f *.toc *.blg *.bbl
	@rm -f *.aux *.pdf *.log
