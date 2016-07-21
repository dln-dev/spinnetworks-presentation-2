all: slides handout article compress clean

projname = spinnetworks
compile = pdflatex

slides: $(projname).header.tex $(projname).slides.tex $(projname).tex
	$(compile) $(projname).slides.tex
	$(compile) $(projname).slides.tex

handout: $(projname).header.tex $(projname).handout.tex $(projname).tex
	$(compile) $(projname).handout.tex
	$(compile) $(projname).handout.tex

article: $(projname).header.tex $(projname).article.tex $(projname).tex
	$(compile) $(projname).article.tex
	bibtex $(projname).article.aux
	$(compile) $(projname).article.tex
	$(compile) $(projname).article.tex

# set PDFSETTINGS to screen for lower or printer/prepress for higher quality
compress: $(projname).slides.pdf $(projname).handout.pdf $(projname).article.pdf
	@@gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=slides.pdf $(projname).slides.pdf
	@@gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=handout.pdf $(projname).handout.pdf
	@@gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=article.pdf $(projname).article.pdf

clean: clean_slides clean_handout clean_article 

clean_slides:
	rm -f $(projname).slides.{aux,fdb_latexmk,fls,log,nav,out,snm,toc}

clean_handout:
	rm -f $(projname).handout.{aux,fdb_latexmk,fls,log,nav,out,snm,toc}

clean_article:
	rm -f $(projname).article.{aux,fdb_latexmk,fls,log,nav,out,snm,toc,bbl,blg}

clean_pdf:
	rm -f $(projname).*.pdf
