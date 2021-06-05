all: lab t5 t5_opt

lab: lab.m
	octave $<

t5: t5.m
	octave $<

t5_opt: t5_opt.m
	octave $<

clean:
	@rm -f octave.log octave-workspace *.eps *~ *.tex *.txt

.PHONY: clean
