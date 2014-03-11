
%.pdf: %.md 
	pandoc -H maspec_figures.sty $^ -o $@ 
	evince $@

all:maspec_figures.pdf maspec_appendix.pdf



