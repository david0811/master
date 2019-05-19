#!/bin/bash

gnuplot << EOF

set terminal epslatex size 6,4 standalone color colortext 10 font ',20'
set output "ImV_T2000.tex"

set border 3 linewidth 5
set tics nomirror
set tmargin 1.5
set rmargin 6

# Set first two line styles to blue (#0060ad) and red (#dd181f)
set style line 1 linecolor rgb '#e41a1c' linetype 1 linewidth 10
set style line 2 linecolor rgb '#377eb8' linetype 1 linewidth 10
set style line 3 linecolor rgb '#4daf4a' linetype 1 linewidth 10
set style line 4 linecolor rgb '#000000' linetype 1 linewidth 10

# Set x and y labels
set label '\(r\left[\mathrm{fm}\right]\)' at graph 1.03,0.05
set label '\(V(r)\left[\mathrm{GeV}\right]\)' at graph 0.02,1.05

# Set arrows on axes
set arrow from graph 1,0 to graph 1.05,0 filled
set arrow from graph 0,1 to graph 0,1.05 filled

#set title '\(T=1~\mathrm{GeV}\)'

set key at graph 0.9, graph 0.65

set xrange [0:1.2]
set xtics 0.2
set yrange [-.01:1.1]
set ytics 0.2

# Plot
plot "ImVcT2000.dat" using 1:2 notitle w l ls 1,\
     "ImVsrT2000.dat" using 1:2 notitle w l ls 3,\
     "ImVsT2000.dat" using 1:2 notitle w l ls 2, \
     "ImVT2000.dat" using 1:2 notitle w l ls 4


EOF

latex "ImV_T2000.tex"
dvips -o "ImV_T2000.ps" "ImV_T2000.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "ImV_T2000.ps" "ImV_T2000.pdf"
rm "ImV_T2000.ps"
open "ImV_T2000.pdf"
