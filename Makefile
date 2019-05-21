main.pdf: main.tex main.bib title.tex preamble.tex figure_hp.pdf figure_owf.pdf
	latexmk -pdfxe main.tex

figure_hp.pdf figure_owf.pdf: %.pdf : %.tex
	latexmk -pdfxe $^
