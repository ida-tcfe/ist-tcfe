all: lab t5

lab: lab.m
	octave $<

t5: t5.m
	octave $<

clean:
	@rm -f octave.log octave-workspace *.eps *~ *.tex *.txt

.PHONY: clean
