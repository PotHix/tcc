# Based on http://wikiri.upc.es/index.php/A_Makefile_to_compile_Latex
# by: Joenio Costa <joenio@perl.org.br>
#
############################### FILES ###############################
#
# DOC: the document

SHELL := /bin/bash

DOC = tcc

############################### PROGRAMS ###############################

TEX = pdflatex
RM = rm -f
CP = cp -f
MAKE = make
PUBLISHFOLDER = /files/Dropbox/FSA-TCC-HTML5
VERSION_NUMBER = $(ls -l $(PUBLISHFOLDER) | grep pdf | awk '{print $8}' | xargs echo | sed s/[A-Za-z_.]//g | head -c 1)

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
		$(CP) $(DOC).pdf $(PUBLISHFOLDER)/$(DOC)$(VERSION_NUMBER).pdf

show:		$(DOC).pdf
		evince $(DOC).pdf

shownew:	clean
		make
		evince $(DOC).pdf
		make clean
