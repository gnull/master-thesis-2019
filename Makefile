main.pdf: main.tex main.bib title.tex preamble.tex title.pdf figure_hp.pdf figure_owf.pdf
	latexmk -pdfxe main.tex

figure_hp.pdf figure_owf.pdf: %.pdf : %.tex
	latexmk -pdfxe $^

title.pdf: %.pdf : %.odt
	libreoffice --convert-to pdf $^
