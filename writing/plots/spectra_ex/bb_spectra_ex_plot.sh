#!/bin/bash

gnuplot bb_spectra_ex_gnu.gp

latex "bb_spectra_ex.tex"
dvips -o "bb_spectra_ex.ps" "bb_spectra_ex.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "bb_spectra_ex.ps" "bb_spectra_ex.pdf"
rm "bb_spectra_ex.ps"
open "bb_spectra_ex.pdf"
