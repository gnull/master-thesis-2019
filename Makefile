main.pdf: main.tex main.bib title.tex preamble.tex title.pdf
	latexmk -pdf main.tex

title.pdf: %.pdf : %.odt
	libreoffice --convert-to pdf $^
