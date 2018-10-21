#!/bin/bash

gnuplot << EOF

set terminal cairolatex standalone size 7,5 font ',14'
set output "chib_width.tex"

set lmargin 12
set bmargin 5

set border linewidth 1.5

set xlabel '\(T\;\left[\mathrm{GeV}\right]\)' offset 0,-1
set ylabel '\(\Gamma\;\left[\mathrm{GeV}\right]\)' offset -2,0

set xrange [0.15:0.22]
set yrange [-0.0015:]

set key at graph 0.9, graph 0.9   
set key spacing 2.5

set style fill transparent solid 0.5 noborder

plot "chib1_width.dat" u 1:3:4 notitle w filledcurves lc rgb '#e41a1c', \
     "" u 1:2 title '\(\chi_{b0}(1S)\)' w l lt 1 lw 4 lc rgb '#e41a1c', \
     "chib2_width.dat" u 1:3:4 notitle w filledcurves lc rgb '#377eb8', \
     "" u 1:2 title '\(\chi_{b0}(2S)\)' w l lt 1 lw 4 lc rgb '#377eb8', \
     "chib3_width.dat" u 1:3:4 notitle w filledcurves lc rgb '#ff7f00', \
     "" u 1:2 title '\(\chi_{b0}(3S)\)' w l lt 1 lw 4 lc rgb '#ff7f00'

EOF

latex "chib_width.tex"
dvips -o "chib_width.ps" "chib_width.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "chib_width.ps" "chib_width.pdf"
rm "chib_width.ps"
open "chib_width.pdf"