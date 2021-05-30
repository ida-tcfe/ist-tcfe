all: clean | lab.log test
	#$(eval NGSFIGS=$(shell grep _FIG ngspice.log | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	#$(eval NGSFIGPS=$(addsuffix .ps, $(NGSFIGS)))
	#$(foreach i, $(NGSFIGPS), ps2pdf $i;)
	#$(eval NGSTABS=$(shell grep _TAB ngspice.log | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	#$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' ngspice.log | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/ \\\\ \\hline/g' | sed 's/g/I/g' | sed 's/[][]//g' | sed 's/i / (A) /g' | sed 's/@//g' | sed 's/vv/ (V)/g' > $i_tab.tex;)

lab.log: 
	ngspice -b t5_lab.net -o $@

clean:
	@rm -f *.log *.tex *.pdf *.ps *~ *.eps

.PHONY: all clean

test:
	sudo python3 reader.py
