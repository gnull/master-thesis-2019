all: slides/main.pdf main.pdf

slides/main.pdf: slides/main.tex figure_hp.pdf
	cd slides && latexmk -pdflua $(shell "basename $<")

main.pdf: main.tex main.bib title.tex preamble.tex figure_hp.pdf figure_owf.pdf
	latexmk -pdflua main.tex

figure_hp.pdf figure_owf.pdf: %.pdf : %.tex preamble-figures.tex
	latexmk -pdflua $<

PHONY: all clean

clean:
	latexmk -C
	cd slides && latexmk -C
