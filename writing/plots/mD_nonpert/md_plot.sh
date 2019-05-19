#!/bin/bash

gnuplot << EOF

set terminal epslatex size 8,6 standalone color colortext 10 font ',20'
set output "md_lat.tex"

set encoding utf8

set border linewidth 5


set xlabel '\(T\;\left[\mathrm{GeV}\right]\)'
set ylabel '\(m_D/T\)' offset 1,0

set xrange [0:0.27]
set yrange [0:2.8]

set style fill transparent solid 0.5 noborder

plot "md_lat_fit_error.dat" u 1:3:4 notitle w filledcurves lc rgb '#984ea3', \
     "" u 1:2 notitle w l lt 1 lw 10 lc rgb '#984ea3', \
     "md_lat_error.dat" u 1:2:3 notitle w yerrorbars lt 7 lw 10 pointsize 3 lc rgb '#a65628'

EOF

latex "md_lat.tex"
dvips -o "md_lat.ps" "md_lat.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "md_lat.ps" "md_lat.pdf"
rm "md_lat.ps"
open "md_lat.pdf"
