mesh: mesh.m
	octave $< > $@.tex

octave.log: random.m
	octave $< > $@

clean:
	@rm -f octave.log octave-workspace *.eps *~ *.tex

.PHONY: clean
