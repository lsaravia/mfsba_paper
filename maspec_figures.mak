all:maspec_figures.pdf

maspec_figures.pdf: maspec_figures.sty maspec_figures.md
	pandoc -H maspec_figures.sty maspec_figures.md -o maspec_figures.pdf 
	evince maspec_figures.pdf		
