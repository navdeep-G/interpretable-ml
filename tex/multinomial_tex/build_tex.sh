#!/bin/bash
latex nips_multinomial_2018.tex
latex nips_multinomial_2018.tex
latex nips_multinomial_2018.tex
pdflatex nips_multinomial_2018.tex
rm nips_multinomial_2018.pdf
pdflatex nips_multinomial_2018.tex
rm sections/*.aux
rm *.aux
rm *.bbl
rm *.blg
rm *.dvi
rm *.log
rm *.nav
rm *.out
rm *.run.xml
rm *.snm
rm *.toc
