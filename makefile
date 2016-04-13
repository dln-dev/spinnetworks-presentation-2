all: slides handout article

projname = spinnetworks
compile = pdflatex

slides: $(projname).header.tex $(projname).beamer.tex $(projname).tex
	$(compile) $(projname).slides.tex

handout: $(projname).header.tex $(projname).handout.tex $(projname).tex
	$(compile) $(projname).handout.tex

article: $(projname).header.tex $(projname).article.tex $(projname).tex
	$(compile) $(projname).article.tex

clean: clean_beamer clean_slides clean_article

clean_slides:
	rm -f $(projname).slides.{aux,fdb_latexmk,fls,log,nav,out,snm,toc}

clean_handout:
	rm -f $(projname).handout.{aux,fdb_latexmk,fls,log,nav,out,snm,toc}

clean_article:
	rm -f $(projname).article.{aux,fdb_latexmk,fls,log,nav,out,snm,toc}

