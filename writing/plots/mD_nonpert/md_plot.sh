#!/bin/bash

gnuplot << EOF

set terminal epslatex size 7,5 standalone color colortext 10 font ',14'
set output "md_lat.tex"

set border linewidth 1.5

#set style line 1 linecolor rgb '#4daf4a' linetype 1 linewidth 3
#set style line 2 linecolor rgb '#4daf4a' linetype 0 linewidth 3
#set style line 3 linecolor rgb '#984ea3' linetype 1 linewidth 3 
#set style line 4 linecolor rgb '#984ea3' linetype 0 linewidth 3 

set xlabel '\(T\;\left[\mathrm{GeV}\right]\)'
set ylabel '\(m_D/T\)'

set xrange [0:0.27]

set style fill transparent solid 0.5 noborder

plot "md_lat_fit_error.dat" u 1:3:4 notitle w filledcurves lc rgb '#984ea3', \
     "" u 1:2 notitle w l lt 1 lw 4 lc rgb '#984ea3', \
     "md_lat_error.dat" u 1:2:3 notitle w yerrorbars lt 6 lw 3 pointsize 2 lc rgb '#a65628'


# NOTE the NA50 r lt 1esults come from 0612013 last column in Table 3, combined with
# di-muon deaclt 1 y widths from PDG: J/Psi=0.05961, Psi'=8e-3

EOF

latex "md_lat.tex"
dvips -o "md_lat.ps" "md_lat.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "md_lat.ps" "md_lat.pdf"
rm "md_lat.ps"
open "md_lat.pdf"
