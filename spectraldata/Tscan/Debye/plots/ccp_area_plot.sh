#!/bin/bash

gnuplot << EOF

set terminal cairolatex standalone size 7,5 font ',14'
set output "chic_area.tex"

set lmargin 12
set bmargin 5

set border linewidth 1.5

set xlabel '\(T\;\left[\mathrm{GeV}\right]\)' offset 0,-1
set ylabel 'A\(\;\left[\mathrm{GeV}\right]\)' offset -3,0

set xrange [0.15:0.164]

set key at graph 0.2, graph 0.2
set key spacing 2.5

set style fill transparent solid 0.5 noborder

plot "chic_area_Debye.dat" u 1:3:4 notitle w filledcurves lc rgb '#e41a1c', \
     "" u 1:2 title '\(\chi_{c0}(1S)\)' w l lt 1 lw 4 lc rgb '#e41a1c', \

EOF

latex "chic_area.tex"
dvips -o "chic_area.ps" "chic_area.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "chic_area.ps" "chic_area.pdf"
rm "chic_area.ps"
open "chic_area.pdf"