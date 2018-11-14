#!/bin/bash

gnuplot << EOF

set terminal cairolatex standalone size 10,5 font ',20'
set output "Snn_ex.tex"

set lmargin 10
set bmargin 5

set border linewidth 1.5

set xlabel '\(\omega\;\left[\mathrm{GeV}\right]\)' offset 0,-1
set ylabel '\(\rho^{V}\left(\omega\right)/\omega^2\)' offset -1.5,0

set xrange [2.25:4.5]
set yrange [0:5]

plot "swccs700uspectra.dat" u 1:2 notitle w l lt 1 lw 4 lc rgb 'light-gray',\
     "swccs700lspectra.dat" u 1:2 notitle w l lt 1 lw 4 lc rgb 'light-gray', \
     "swccs700spectra.dat" u 1:2 notitle w l lt 1 lw 6 lc rgb '#377eb8',\
     


# NOTE the NA50 results come from 0612013 last column in Table 3, combined with
# di-muon deacy widths from PDG: J/Psi=0.05961, Psi'=8e-3

EOF

latex "Snn_ex.tex"
dvips -o "Snn_ex.ps" "Snn_ex.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "Snn_ex.ps" "Snn_ex.pdf"
rm "Snn_ex.ps"
open "Snn_ex.pdf"