#!/bin/bash

gnuplot << EOF

set terminal epslatex size 7,5 standalone color colortext 10 font ',20'
set output "pT_ratio.tex"

set border linewidth 5

set xlabel '\(p_T\)'
set ylabel 'Relative production \(\;\psi^\prime/J/\psi\)'

set xrange [-1:26]
set xtics nomirror
set yrange [0.03:0.04]
set ytics nomirror

set key samplen 2

set key at graph 0.9, graph 0.3
set key spacing 1.4

plot 'pT_ratio_par.dat' u 1:2 notitle w p ps 4 lt 7 lc rgb '#984ea3',\
     '' u 1:2 title 'Parallel' w l lw 10 lc rgb '#984ea3',\
     'pT_ratio_perp.dat' u 1:2 notitle w p ps 4 lt 7 lc rgb '#4daf4a',\
     '' u 1:2 title 'Perpendicular' w l lw 10 lc rgb '#4daf4a'

EOF

latex "pT_ratio.tex"
dvips -o "pT_ratio.ps" "pT_ratio.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "pT_ratio.ps" "pT_ratio.pdf"
rm "pT_ratio.ps"
open "pT_ratio.pdf"
