# Based on http://wikiri.upc.es/index.php/A_Makefile_to_compile_Latex
# by: Joenio Costa <joenio@perl.org.br>
#
############################### FILES ###############################
#
# DOC: the document

DOC = tcc

############################### PROGRAMS ###############################

TEX = pdflatex
RM = rm -f
CP = cp -f
MAKE = make

########################################################################

$(DOC).pdf:
		$(TEX) $(DOC).tex
		bibtex $(DOC).aux
		$(TEX) $(DOC).tex
		$(TEX) $(DOC).tex

clean:
		$(RM) $(DOC).aux $(DOC).log
		$(RM) $(DOC).toc $(DOC).lot $(DOC).lof
		$(RM) $(DOC).ttt $(DOC).lot $(DOC).fff
		$(RM) $(DOC).blg $(DOC).out
		$(RM) $(DOC).dvi $(DOC)-*.dvi
		$(RM) $(DOC).ps $(DOC)-*.ps
		$(RM) $(DOC).tex.backup
		$(RM) $(DOC).tex.bak
		$(RM) $(DOC).bbl
		$(RM) $(DOC).pdf
		$(RM) $(DOC).tex~
		$(RM) $(DOC).bib~
		$(RM) Makefile~
		$(RM) *.ind *.ilg *.idx *.aux
		$(RM) texput.log core

publish:	$(DOC).pdf
		./update_file_version $(DOC)
		make clean

show:		clean
		make
		open $(DOC).pdf
todo:
		grep TODO *.tex -R
