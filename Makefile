COMPILER = pdflatex --interaction nonstopmode -output-directory Build
BIBEL = bibtex

.PHONY: clean log

default: *.tex *.bib
	$(COMPILER) thesis.tex; \
	cd Build; $(BIBEL) thesis.aux; cd ..; \
	$(COMPILER) thesis.tex; \
	cp Build/thesis.pdf Release/thesis.pdf

bibpdf: *.tex *.bib
	$(COMPILER) make_bib.tex; \
	$(BIBEL) Build/make_bib.aux; \
	$(COMPILER) make_bib.tex; \
	cp Build/thesis.pdf Release/thesis.pdf

clean:
	@rm -f Build/*
