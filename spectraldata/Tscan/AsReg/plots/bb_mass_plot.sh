#!/bin/bash

gnuplot << EOF

set terminal cairolatex standalone size 7,5 font ',20'
set output "bb_mass.tex"

set lmargin 12
set bmargin 5

set border linewidth 1.5

set xlabel '\(T\;\left[\mathrm{GeV}\right]\)' offset 0,-1
set ylabel 'M\(\;\left[\mathrm{GeV}\right]\)' offset -2,0

set xrange [0.15:0.5]
set yrange [8.95:]

set ytics 0.4

set key at graph 0.95, graph 0.95
set key spacing 2.5

set title 'Bottomonium \(^3S_1\) in-medium mass'

set style fill transparent solid 0.5 noborder

plot "bb_Econt.dat" u 1:3:4 notitle w filledcurves lc rgb 'light-gray', \
     "" u 1:2 title '\(E_{cont}\)' w l lt 1 lw 2 lc rgb 'light-gray', \
     "Upsilon1_mass.dat" u 1:3:4 notitle w filledcurves lc rgb '#e41a1c', \
     "" u 1:2 title '\(\Upsilon(1S)\)' w l lt 1 lw 4 lc rgb '#e41a1c', \
     "Upsilon2_mass.dat" u 1:3:4 notitle w filledcurves lc rgb '#377eb8', \
     "" u 1:2 title '\(\Upsilon(2S)\)' w l lt 1 lw 4 lc rgb '#377eb8', \
     "Upsilon3_mass.dat" u 1:3:4 notitle w filledcurves lc rgb '#ff7f00', \
     "" u 1:2 title '\(\Upsilon(3S)\)' w l lt 1 lw 4 lc rgb '#ff7f00'

EOF

latex "bb_mass.tex"
dvips -o "bb_mass.ps" "bb_mass.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "bb_mass.ps" "bb_mass.pdf"
rm "bb_mass.ps"
open "bb_mass.pdf"