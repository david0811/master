#!/bin/bash

gnuplot << EOF

set terminal epslatex size 6,4 standalone color colortext 10 font ',20'
set output "ImV_T200.tex"

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
set label '\(\mathrm{Im}V(r)\left[\mathrm{GeV}\right]\)' at graph 0.02,1.05

# Set arrows on axes
set arrow from graph 1,0 to graph 1.05,0 filled
set arrow from graph 0,1 to graph 0,1.05 filled

#set title '\(T=1~\mathrm{GeV}\)'

set key at graph 0.57, graph 0.9
set key spacing 1.5
set key samplen 2

set xrange [0:2]
set xtics 0.5
set yrange [-.01:0.7]
set ytics 0.2

#set label '(a)' at graph 1.05,0.9

# Plot
plot "ImVcT200.dat" using 1:2 title '\(\mathrm{Im}V_{C}\)' w l ls 1,\
     "ImVsrT200.dat" using 1:2 title '\(\mathrm{Im}V_{S}^{(\mathrm{reg})}\)' w l ls 3,\
     "ImVsT200.dat" using 1:2 title '\(\mathrm{Im}V_{S}^{(\mathrm{unreg})}\)' w l ls 2, \
     "ImVT200.dat" using 1:2 notitle w l ls 4

EOF

latex "ImV_T200.tex"
dvips -o "ImV_T200.ps" "ImV_T200.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "ImV_T200.ps" "ImV_T200.pdf"
rm "ImV_T200.ps"
open "ImV_T200.pdf"
