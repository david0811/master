#!/bin/bash

gnuplot << EOF

set terminal epslatex size 7,5 standalone color colortext 10 font ',14'
set output "cc_mass_T250_perp.tex"

set border linewidth 1.5

set xlabel '\(v_{\perp}\)' 
set ylabel '\(\Gamma\;\left[\mathrm{GeV}\right]\)'

set key at graph 0.3, graph 0.2

set style fill transparent solid 0.5 noborder

plot "../data/Jpsi_mass_T250_perp.dat" u 1:3:4 notitle w filledcurves lc rgb '#4daf4a', \
     "" u 1:2 title '\(J/\psi\)' w l lt 1 lw 4 lc rgb '#4daf4a'

EOF

latex "cc_mass_T250_perp.tex"
dvips -o "cc_mass_T250_perp.ps" "cc_mass_T250_perp.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "cc_mass_T250_perp.ps" "cc_mass_T250_perp.pdf"
rm "cc_mass_T250_perp.ps"
open "cc_mass_T250_perp.pdf"
