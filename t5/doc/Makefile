# ---------------------------------------------------------
# type the "make" command to create report.pdf 
# ---------------------------------------------------------

#doc name
FILE=report

#list of LibreOffice Draw files
LODFIGS = $(patsubst %.odg,%.pdf,$(wildcard *.odg))

all: $(FILE).pdf 
	evince $< &

$(FILE).pdf: $(wildcard *.tex) $(LODFIGS)
	#python error.py
	export TEXINPUTS=$(TEXINPUTS)
	cp -f ../mat/*.eps .
	cp -f ../sim/*.eps .
	pdflatex  $(FILE).tex
	pdflatex  $(FILE).tex
	pdflatex  $(FILE).tex


#convert libreoffice draw figures to pdf
%.pdf: %.odg
	soffice --headless --convert-to pdf $<

clean:
	@rm -rf *.aux *.bbl *.blg *.glg *.glo *.gls *.ilg *.ist *.lof
	@rm -rf *.log *.lot *.nlo *.nls *.out *.toc *~ *.*% ./*.pdf ./*.eps
	@rm -rf lab.tex mb.tex centralf.tex centralf_opt.tex comparison.tex comparison_mb.tex merit.tex cost.tex ampop.tex

.PHONY: all clean 


