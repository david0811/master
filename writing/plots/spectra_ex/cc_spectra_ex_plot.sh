#!/bin/bash

gnuplot cc_spectra_ex_gnu.gp

latex "cc_spectra_ex.tex"
dvips -o "cc_spectra_ex.ps" "cc_spectra_ex.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "cc_spectra_ex.ps" "cc_spectra_ex.pdf"
rm "cc_spectra_ex.ps"
open "cc_spectra_ex.pdf"
