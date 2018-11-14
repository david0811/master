#!/bin/bash

gnuplot << EOF

set terminal cairolatex standalone size 10,5 font ',20'
set output "reg_check.tex"

set lmargin 10
set bmargin 5

set border linewidth 1.5

set xlabel '\(\omega\;\left[\mathrm{GeV}\right]\)' offset 0,-1
set ylabel '\(\rho^{S}\left(\omega\right)/\omega^2\)' offset -1,0

set xrange [2.501:5]

set key at graph 0.95, graph 0.95     
set key spacing 2.5

plot "pwccT155spectra.dat" u 1:2 title 'Unregulated' w l lt 1 lw 6 lc rgb '#ff7f00',\
     "pwccT155spectraAS.dat" u 1:2 title 'Regulated' w l lt 1 lw 6 lc rgb '#377eb8'
     


# NOTE the NA50 results come from 0612013 last column in Table 3, combined with
# di-muon deacy widths from PDG: J/Psi=0.05961, Psi'=8e-3

EOF

latex "reg_check.tex"
dvips -o "reg_check.ps" "reg_check.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "reg_check.ps" "reg_check.pdf"
rm "reg_check.ps"
open "reg_check.pdf"