all: slides/main.pdf short-text/main.pdf long-text/main.pdf

slides/main.pdf: slides/main.tex standalone/figure_hp.pdf
	cd slides && latexmk -pdflua $(shell "basename $<")

short-text/main.pdf: short-text/main.tex main.bib title.tex short-text/preamble.tex standalone/figure_hp.pdf standalone/figure_owf.pdf
	cd short-text/ && latexmk -pdflua main.tex

long-text/main.pdf: long-text/main.tex main.bib title.tex long-text/preamble.tex standalone/figure_hp.pdf standalone/figure_owf.pdf
	cd long-text/ && latexmk -pdflua main.tex

standalone/figure_hp.pdf: standalone/figure_hp.tex standalone/preamble-figures.tex
	cd standalone && latexmk -pdflua figure_hp.tex

standalone/figure_owf.pdf: standalone/figure_owf.tex standalone/preamble-figures.tex
	cd standalone && latexmk -pdflua figure_owf.tex

PHONY: all clean

clean:
	cd short-text && latexmk -C
	cd long-text && latexmk -C
	cd slides && latexmk -C
	cd standalone && latexmk -C
