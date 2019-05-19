#!/bin/bash

gnuplot << EOF

set terminal cairolatex standalone size 7,5 font ',20'
set output "bb_width.tex"

set lmargin 12
set bmargin 5

set border linewidth 5

set xlabel '\(T\;\left[\mathrm{GeV}\right]\)' offset 0,-1
set ylabel '\(\Gamma\;\left[\mathrm{GeV}\right]\)' offset -2,0

set xrange [0.151:0.5]
set yrange [-0.005:]
set ytics 0.1

set key at graph 0.85, graph 0.97
set key spacing 2.5

set style fill transparent solid 0.5 noborder

plot "Upsilon1_width.dat" u 1:3:4 notitle w filledcurves lc rgb '#377eb8', \
     "" u 1:2 title '\(\Upsilon(1S)\)' w l lt 1 lw 10 lc rgb '#377eb8', \
     "Upsilon2_width.dat" u 1:3:4 notitle w filledcurves lc rgb '#ff7f00', \
     "" u 1:2 title '\(\Upsilon(2S)\)' w l lt 1 lw 10 lc rgb '#ff7f00', \
     "Upsilon3_width.dat" u 1:3:4 notitle w filledcurves lc rgb '#e41a1c', \
     "" u 1:2 title '\(\Upsilon(3S)\)' w l lt 1 lw 10 lc rgb '#e41a1c'

EOF

latex "bb_width.tex"
dvips -o "bb_width.ps" "bb_width.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "bb_width.ps" "bb_width.pdf"
rm "bb_width.ps"
open "bb_width.pdf"
