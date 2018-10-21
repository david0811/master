#!/bin/bash

gnuplot << EOF

set terminal cairolatex standalone size 7,5 font ',14'
set output "chib_area.tex"

set lmargin 12
set bmargin 5

set border linewidth 1.5

set xlabel '\(T\;\left[\mathrm{GeV}\right]\)' offset 0,-1
set ylabel 'A\(\;\left[\mathrm{GeV}\times 10^{-5}\right]\)' offset -2,0

set xrange [0.15:0.189]

set key at graph 0.8, graph 0.3
set key spacing 2.5

set style fill transparent solid 0.5 noborder

plot "chib1_area_Debye.dat" u 1:3:4 notitle w filledcurves lc rgb '#e41a1c', \
     "" u 1:2 title '\(\chi_{b0}(1S)\)' w l lt 1 lw 4 lc rgb '#e41a1c', \
     "chib2_area_Debye.dat" u 1:3:4 notitle w filledcurves lc rgb '#377eb8', \
     "" u 1:2 title '\(\chi_{b0}(2S)\)' w l lt 1 lw 4 lc rgb '#377eb8', \
     "chib3_area_Debye.dat" u 1:2:3 notitle w filledcurves lc rgb '#ff7f00', \
     "" u 1:2 title '\(\chi_{b0}(3S)\)' w l lt 1 lw 4 lc rgb '#ff7f00'

EOF

latex "chib_area.tex"
dvips -o "chib_area.ps" "chib_area.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "chib_area.ps" "chib_area.pdf"
rm "chib_area.ps"
open "chib_area.pdf"