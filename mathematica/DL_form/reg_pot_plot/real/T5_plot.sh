#!/bin/bash

gnuplot << EOF

set terminal epslatex size 6,4 standalone color colortext 10 font ',20'
set output "ReV_T500.tex"

set border 3 linewidth 5
set tics nomirror
set tmargin 1.5
set rmargin 6
set lmargin 5

# Set first two line styles to blue (#0060ad) and red (#dd181f)
set style line 1 linecolor rgb '#e41a1c' linetype 1 linewidth 10
set style line 2 linecolor rgb '#999999' linetype 1 linewidth 10
set style line 3 linecolor rgb '#4daf4a' linetype 1 linewidth 10
set style line 4 linecolor rgb '#000000' linetype 1 linewidth 10

# Set x and y labels
set label '\(r\left[\mathrm{fm}\right]\)' at graph 1.03,0.05
set label '\(\mathrm{Re}V(r)\left[\mathrm{GeV}\right]\)' at graph 0.02,1.05

# Set arrows on axes
set arrow from graph 1,0 to graph 1.05,0 filled
set arrow from graph 0,1 to graph 0,1.05 filled

#set title '\(T=1~\mathrm{GeV}\)'

set key at graph 0.57, graph 0.9
set key spacing 1.5
set key samplen 2

set xrange [0:1]
set xtics 0.2
set yrange [-1.5:0.5]
set ytics 0.5

#set label '(a)' at graph 1.05,0.9


# Plot
plot "ReVT0.dat" using 1:2 notitle w l ls 2, \
     "ReVcT500.dat" using 1:2 notitle w l ls 1,\
     "ReVsT500.dat" using 1:2 notitle w l ls 3, \
     "ReVT500.dat" using 1:2 notitle w l ls 4


EOF

latex "ReV_T500.tex"
dvips -o "ReV_T500.ps" "ReV_T500.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "ReV_T500.ps" "ReV_T500.pdf"
rm "ReV_T500.ps"
open "ReV_T500.pdf"
