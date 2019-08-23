#!/bin/bash

gnuplot spectra_gnu.gp

latex "spectra_ex.tex"
dvips -o "spectra_ex.ps" "spectra_ex.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "spectra_ex.ps" "spectra_ex.pdf"
rm "spectra_ex.ps"
open "spectra_ex.pdf"
