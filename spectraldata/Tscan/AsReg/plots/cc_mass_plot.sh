#!/bin/bash

gnuplot << EOF

set terminal cairolatex standalone size 7,5 font ',20'
set output "cc_mass.tex"

set lmargin 10
set bmargin 5

set border linewidth 5

set xlabel '\(T\;\left[\mathrm{GeV}\right]\)' offset 0,-1
set ylabel 'M\(\;\left[\mathrm{GeV}\right]\)' offset -2,0

set xrange [0.15:0.3]
set yrange [2.7:3.8]

set ytics 0.4

set key at graph 0.95, graph 0.95
set key spacing 2.5

set style fill transparent solid 0.5 noborder

plot "cc_Econt.dat" u 1:3:4 notitle w filledcurves lc rgb 'light-gray', \
     "" u 1:2 title '\(E_{cont}\)' w l lt 1 lw 8 lc rgb 'light-gray', \
     "Jpsi_mass.dat" u 1:3:4 notitle w filledcurves lc rgb '#377eb8', \
     "" u 1:2 title '\(J/\psi\)' w l lt 1 lw 10 lc rgb '#377eb8', \
     "psip_mass.dat" u 1:3:4 notitle w filledcurves lc rgb '#e41a1c', \
     "" u 1:2 title '\(\psi(2S)\)' w l lt 1 lw 10 lc rgb '#e41a1c', \



# NOTE the NA50 results come from 0612013 last column in Table 3, combined with
# di-muon deacy widths from PDG: J/Psi=0.05961, Psi'=8e-3

EOF

latex "cc_mass.tex"
dvips -o "cc_mass.ps" "cc_mass.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "cc_mass.ps" "cc_mass.pdf"
rm "cc_mass.ps"
open "cc_mass.pdf"
