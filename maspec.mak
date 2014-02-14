all:maspec.pdf

maspec.pdf: maspec.md margins.sty maspec.bib maspec.mak
	cp "/home/leonardo/BibTeX/Manuscritos-Multifractals patterns in natural communities.bib" maspec.bib
	pandoc -H margins.sty --bibliography maspec.bib --csl=plos.csl maspec.md -o maspec.pdf 
	evince maspec.pdf		

maspec.ltx: maspec.md margins.sty maspec.bib maspec.mak
	cp "/home/leonardo/BibTeX/Manuscritos-Multifractals patterns in natural communities.bib" maspec.bib
	pandoc --bibliography maspec.bib --csl=plos.csl maspec.md -o maspec.ltx
		
maspec_full.pdf: maspec.pdf maspec_figures.pdf
	pdftk maspec.pdf maspec_figures.pdf output maspec_full.pdf	
