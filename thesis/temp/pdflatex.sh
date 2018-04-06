#!/bin/bash

pdflatex $1
bibtex $1
pdflatex $1
pdflatex $1

rm *.aux
rm *.log
rm *.bbl
rm *.blg
rm *.lof
rm *.lot
rm *.out
rm *.toc