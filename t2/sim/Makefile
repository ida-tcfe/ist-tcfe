all: ngspice.log
	$(eval NGSFIGS=$(shell grep _FIG $< | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(eval NGSFIGPS=$(addsuffix .ps, $(NGSFIGS)))
	$(foreach i, $(NGSFIGPS), ps2pdf $i;)
	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' | sed 's/g/I/g' | sed 's/[][]//g' | sed 's/i / (A) /g' | sed 's/@//g' | sed 's/vv/ (V)/g' | sed 's/v(n5 (V), n7 (V))/Vc (V)/g' | sed 's/v(n3 (V), n5 (V))/Vb (V)/g' | sed 's/r6/Ic/g' | sed 's/hc/IVc/g' | sed 's/va/IVa/g' > $i_tab.tex;)

ngspice.log: t1.net
	ngspice -b $< -o $@

clean:
	@rm -f ngspice.log *.tex *.pdf *.ps *~

.PHONY: all clean