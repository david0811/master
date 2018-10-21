#!/bin/bash

gnuplot << EOF

set terminal cairolatex standalone size 7,5 font ',14'
set output "cc_area.tex"

set lmargin 12
set bmargin 5

set border linewidth 1.5

set xlabel '\(T\;\left[\mathrm{GeV}\right]\)' offset 0,-1
set ylabel 'A\(\;\left[\mathrm{GeV}\right]\)' offset -2,0

set xrange [0.15:0.3]

set key at graph 0.8, graph 0.3     
set key spacing 2.5

set style fill transparent solid 0.5 noborder

plot "Jpsi_area_Debye.dat" u 1:3:4 notitle w filledcurves lc rgb '#e41a1c', \
     "" u 1:2 title '\(J/\psi\)' w l lt 1 lw 4 lc rgb '#e41a1c', \
     "psip_area_Debye.dat" u 1:3:4 notitle w filledcurves lc rgb '#377eb8', \
     "" u 1:2 title '\(\psi(2S)\)' w l lt 1 lw 4 lc rgb '#377eb8', \

EOF

latex "cc_area.tex"
dvips -o "cc_area.ps" "cc_area.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "cc_area.ps" "cc_area.pdf"
rm "cc_area.ps"
open "cc_area.pdf"