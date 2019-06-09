all: slides/main.pdf main.pdf

slides/main.pdf: slides/main.tex standalone/figure_hp.pdf
	cd slides && latexmk -pdflua $(shell "basename $<")

main.pdf: main.tex main.bib title.tex preamble.tex standalone/figure_hp.pdf standalone/figure_owf.pdf
	latexmk -pdflua main.tex

standalone/figure_hp.pdf: standalone/figure_hp.tex standalone/preamble-figures.tex
	cd standalone && latexmk -pdflua figure_hp.tex

standalone/figure_owf.pdf: standalone/figure_owf.tex standalone/preamble-figures.tex
	cd standalone && latexmk -pdflua figure_owf.tex

PHONY: all clean

clean:
	latexmk -C
	cd slides && latexmk -C
	cd standalone && latexmk -C
