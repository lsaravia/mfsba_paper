all:mpnc_MEE.pdf

maspec.pdf: maspec.md margins.sty maspec.bib maspec.mak
	cp "/home/leonardo/BibTeX/Manuscritos-Multifractals patterns in natural communities.bib" maspec.bib
	pandoc -H margins.sty --bibliography maspec.bib --csl=plos.csl maspec.md -o maspec.pdf 
	evince maspec.pdf		

maspec.docx: maspec.md margins.sty maspec.bib maspec.mak
	cp "/home/leonardo/BibTeX/Manuscritos-Multifractals patterns in natural communities.bib" maspec.bib
	pandoc -H margins.sty --bibliography maspec.bib --csl=plos.csl maspec.md -o maspec.docx 
			
