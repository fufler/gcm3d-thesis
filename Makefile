PLFLAGS=-halt-on-error

default: build

build:
	pdflatex ${PLFLAGS} ermakov_thesis.tex
	pdflatex ${PLFLAGS} ermakov_thesis.tex

clean:
	rm -f *.log *.aux *.tdo *.toc *.out eps/*-converted-to.pdf
