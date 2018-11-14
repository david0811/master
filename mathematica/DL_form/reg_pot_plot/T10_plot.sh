#!/bin/bash

gnuplot << EOF

set terminal epslatex size 6,4 standalone color colortext 10 font ',20'
set output "ImV_T1000.tex"

set border linewidth 1.5 
# Set first two line styles to blue (#0060ad) and red (#dd181f)
set style line 1 linecolor rgb '#e41a1c' linetype 1 linewidth 6
set style line 2 linecolor rgb '#377eb8' linetype 1 linewidth 6 
set style line 3 linecolor rgb '#4daf4a' linetype 1 linewidth 6 

set xlabel '\(r\;\left[\mathrm{fm}\right]\)'
set ylabel '\(\left[\mathrm{GeV}\right]\)'

set title '\(T=1~\mathrm{GeV}\)'

set key at graph 0.9, graph 0.65

set xrange [0:1]
#set yrange [-.01:0.3]


# Plot
plot "ImVcT1000.dat" using 1:2 notitle w l ls 1,\
     "ImVsrT1000.dat" using 1:2 notitle w l ls 3,\
     "ImVsT1000.dat" using 1:2 notitle w l ls 2


EOF

latex "ImV_T1000.tex"
dvips -o "ImV_T1000.ps" "ImV_T1000.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "ImV_T1000.ps" "ImV_T1000.pdf"
rm "ImV_T1000.ps"
open "ImV_T1000.pdf"