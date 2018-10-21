#!/bin/bash

gnuplot << EOF

set terminal cairolatex standalone size 7,5 font ',14'
set output "chic_width.tex"

set lmargin 12
set bmargin 5

set border linewidth 1.5

set xlabel '\(T\;\left[\mathrm{GeV}\right]\)' offset 0,-1
set ylabel '\(\Gamma\;\left[\mathrm{GeV}\right]\)' offset -2,0

set xrange [0.15:0.22]
set yrange [-0.002:]

set key at graph 0.9, graph 0.9   
set key spacing 2.5

set style fill transparent solid 0.5 noborder

plot "chic_width.dat" u 1:3:4 notitle w filledcurves lc rgb '#e41a1c', \
     "" u 1:2 title '\(\chi_{c0}(1S)\)' w l lt 1 lw 4 lc rgb '#e41a1c', \
     "chic2_width.dat" u 1:3:4 notitle w filledcurves lc rgb '#377eb8', \
     "" u 1:2 title '\(\chi_{c0}(2S)\)' w l lt 1 lw 4 lc rgb '#377eb8'

EOF

latex "chic_width.tex"
dvips -o "chic_width.ps" "chic_width.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "chic_width.ps" "chic_width.pdf"
rm "chic_width.ps"
open "chic_width.pdf"