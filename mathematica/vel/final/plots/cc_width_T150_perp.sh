#!/bin/bash

gnuplot << EOF

set terminal epslatex size 7,5 standalone color colortext 10 font ',14'
set output "cc_width_T150_perp.tex"

set border linewidth 1.5

#set style line 1 linecolor rgb '#4daf4a' linetype 1 linewidth 3
#set style line 2 linecolor rgb '#4daf4a' linetype 0 linewidth 3
#set style line 3 linecolor rgb '#984ea3' linetype 1 linewidth 3 
#set style line 4 linecolor rgb '#984ea3' linetype 0 linewidth 3 

set xlabel '\(v_{\perp}\)' 
set ylabel '\(\Gamma\;\left[\mathrm{GeV}\right]\)'

set key horizontal at graph 0.55, graph 0.27

set style fill transparent solid 0.5 noborder

plot "../data/Jpsi_width_T150_perp.dat" u 1:3:4 notitle w filledcurves lc rgb '#4daf4a', \
     "" u 1:2 title '\(J/\psi\)' w l lt 1 lw 4 lc rgb '#4daf4a', \
     "../data/psip_width_T150_perp.dat" u 1:3:4 notitle w filledcurves lc rgb '#984ea3', \
     "" u 1:2 title '\(\psi(2S)\)' w l lt 1 lw 4 lc rgb '#984ea3'


# NOTE the NA50 r lt 1esults come from 0612013 last column in Table 3, combined with
# di-muon deaclt 1 y widths from PDG: J/Psi=0.05961, Psi'=8e-3

EOF

latex "cc_width_T150_perp.tex"
dvips -o "cc_width_T150_perp.ps" "cc_width_T150_perp.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "cc_width_T150_perp.ps" "cc_width_T150_perp.pdf"
rm "cc_width_T150_perp.ps"
open "cc_width_T150_perp.pdf"
