all: run ng1 ng2

run:
	ngspice -b t2_1.net -o ngspice1.log
	ngspice -b t2_2.net -o ngspice2.log
	ngspice -b t2_3.net -o ngspice3.log
	ngspice -b t2_4.net -o ngspice4.log
	ngspice -b t2_5.net -o ngspice5.log

ng1: ngspice1.log
	$(eval NGSFIGS=$(shell grep _FIG $< | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(eval NGSFIGPS=$(addsuffix .ps, $(NGSFIGS)))
	$(foreach i, $(NGSFIGPS), ps2pdf $i;)
	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' | sed 's/g/I/g' | sed 's/[][]//g' | sed 's/i / (A) /g' | sed 's/@//g' | sed 's/vv/ (V)/g' | sed 's/hd/IVd/g' | sed 's/vs/IVs/g' > $i_ng1_tab.tex;)

ng2: ngspice2.log
	$(eval NGSFIGS=$(shell grep _FIG $< | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(eval NGSFIGPS=$(addsuffix .ps, $(NGSFIGS)))
	$(foreach i, $(NGSFIGPS), ps2pdf $i;)
	$(eval NGSTABS=$(shell grep _TAB $< | sed 's/_TAB//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(foreach i, $(NGSTABS), sed -n '/^$i_TAB/,/^$i_END/{p;/^$i_END/q}' $< | grep -v $i_TAB | grep -v $i_END | grep -v '#' | sed 's/\=/\&/g' | sed 's/$$/\\\\ \\hline/g' | sed 's/g/I/g' | sed 's/[][]//g' | sed 's/i / (A) /g' | sed 's/@//g' | sed 's/vv/ (V)/g' | sed 's/hd/IVd/g' | sed 's/vs/IVs/g' | sed 's/vx/IVx/g' > $i_ng2_tab.tex;)

clean:
	@rm -f *.log *.tex *.pdf *.eps *.txt *~

.PHONY: all clean
