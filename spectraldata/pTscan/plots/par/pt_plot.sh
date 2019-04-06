#!/bin/bash

gnuplot << EOF

set terminal epslatex size 7,5 standalone color colortext 10 font ',14'
set output "pT_ratio.tex"

set border linewidth 1.5

set xlabel '\(p_T\)'
set ylabel 'Relative production \(\;\psi(2S)/J/\psi\)'

set xrange [-1:26]
set xtics nomirror
set yrange [0.03:0.04]
set ytics nomirror

plot 'pT_ratio.dat' u 1:2 notitle w p lt 7 pointsize 2 lc rgb '#984ea3'

EOF

latex "pT_ratio.tex"
dvips -o "pT_ratio.ps" "pT_ratio.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "pT_ratio.ps" "pT_ratio.pdf"
rm "pT_ratio.ps"
open "pT_ratio.pdf"
