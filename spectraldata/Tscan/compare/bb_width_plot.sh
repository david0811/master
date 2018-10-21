#!/bin/bash

gnuplot << EOF

set terminal cairolatex standalone size 7,5 font ',14'
set output "bb_width.tex"

set lmargin 12
set bmargin 5

set border linewidth 1.5

set xlabel '\(T\;\left[\mathrm{GeV}\right]\)' offset 0,-1
set ylabel '\(\Gamma\;\left[\mathrm{GeV}\right]\)' offset -2,0

set xrange [0.15:0.5]
set yrange [-0.005:]

set key at graph 0.9, graph 0.8    
set key spacing 2.5

set style fill transparent solid 0.5 noborder

plot "../Debye/plots/Upsilon1_width_Debye.dat" u 1:3:4 notitle w filledcurves fs transparent solid 0.2 lc rgb '#e41a1c', \
     "../Debye/plots/Upsilon2_width_Debye.dat" u 1:3:4 notitle w filledcurves fs transparent solid 0.2 lc rgb '#377eb8', \
     "../Debye/plots/Upsilon3_width_Debye.dat" u 1:3:4 notitle w filledcurves fs transparent solid 0.2 lc rgb '#ff7f00', \
     "../AsReg/plots/Upsilon1_width.dat" u 1:3:4 notitle w filledcurves lc rgb '#e41a1c', \
     "" u 1:2 title '\(\Upsilon(1S)\)' w l lt 1 lw 6 lc rgb '#e41a1c', \
     "../AsReg/plots/Upsilon2_width.dat" u 1:3:4 notitle w filledcurves lc rgb '#377eb8', \
     "" u 1:2 title '\(\Upsilon(2S)\)' w l lt 1 lw 6 lc rgb '#377eb8', \
     "../AsReg/plots/Upsilon3_width.dat" u 1:3:4 notitle w filledcurves lc rgb '#ff7f00', \
     "" u 1:2 title '\(\Upsilon(3S)\)' w l lt 1 lw 6 lc rgb '#ff7f00'

EOF

latex "bb_width.tex"
dvips -o "bb_width.ps" "bb_width.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "bb_width.ps" "bb_width.pdf"
rm "bb_width.ps"
open "bb_width.pdf"