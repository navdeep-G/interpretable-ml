#!/bin/bash
cd tex/
latex interpretable_ml.tex
bibtex interpretable_ml
latex interpretable_ml.tex
latex interpretable_ml.tex
pdflatex interpretable_ml.tex
rm interpretable_ml.pdf
pdflatex interpretable_ml.tex
mv interpretable_ml.pdf ../
rm sections/*.aux
rm ../tex/*.aux
rm ../tex/*.bbl
rm ../tex/*.blg
rm ../tex/*.dvi
rm ../tex/*.log
rm ../tex/*.nav
rm ../tex/*.out
rm ../tex/*.run.xml
rm ../tex/*.snm
rm ../tex/*.toc
rm ../tex/interpretable_ml-blx.bib
