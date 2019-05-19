#!/bin/bash

gnuplot << EOF

set terminal epslatex size 6,4 standalone color colortext 10 font ',20'
set output "ImV_par.tex"

set border 3 linewidth 5
set tics nomirror
set tmargin 1.5
set rmargin 6

set style line 3 linecolor rgb '#984ea3' linetype 1 linewidth 10
set style line 4 linecolor rgb '#e41a1c' linetype 1 linewidth 10
set style line 2 linecolor rgb '#377eb8' linetype 1 linewidth 10
set style line 1 linecolor rgb '#999999' linetype 1 linewidth 10

# Set x and y labels
set label '\(r\left[\mathrm{fm}\right]\)' at graph 1.03,0.05
set label '\(\mathrm{Im}V(\mathbf{r}\parallel\mathbf{v})\left[\mathrm{GeV}\right]\)' at graph 0.02,1.05

# Set arrows on axes
set arrow from graph 1,0 to graph 1.05,0 filled
set arrow from graph 0,1 to graph 0,1.05 filled

set key vertical
set key spacing 1
set key samplen 1
set key at graph 0.55, graph 0.45

set xrange [0:9]
set xtics 2
set yrange [-6:5]
set ytics 2

# Plot
plot "ImVu0_par.dat" using 1:2 title '\(v=0\)' w l ls 1,\
     "ImVu5_par.dat" using 1:2 title '\(v=0.5\)' w l ls 2,\
     "ImVu9_par.dat" using 1:2 title '\(v=0.9\)' w l ls 3, \
     "ImVu99_par.dat" using 1:2 title '\(v=0.99\)' w l ls 4

EOF

latex "ImV_par.tex"
dvips -o "ImV_par.ps" "ImV_par.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "ImV_par.ps" "ImV_par.pdf"
rm "ImV_par.ps"
open "ImV_par.pdf"
