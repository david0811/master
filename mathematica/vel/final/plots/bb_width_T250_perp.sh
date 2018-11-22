#!/bin/bash

gnuplot << EOF

set terminal epslatex size 7,5 standalone color colortext 10 font ',14'
set output "bb_width_T250_perp.tex"

set border linewidth 1.5

set xlabel '\(v_{\perp}\)' 
set ylabel '\(\Gamma\;\left[\mathrm{GeV}\right]\)'

set key spacing 1.5
set key at graph 0.9, graph 0.4

set style fill transparent solid 0.5 noborder

plot "../data/Upsilon1_width_T250_perp.dat" u 1:3:4 notitle w filledcurves lc rgb '#e41a1c', \
     "" u 1:2 title '\(\Upsilon(1S)\)' w l lt 1 lw 4 lc rgb '#e41a1c', \
     "../data/Upsilon2_width_T250_perp.dat" u 1:3:4 notitle w filledcurves lc rgb '#377eb8', \
     "" u 1:2 title '\(\Upsilon(2S)\)' w l lt 1 lw 4 lc rgb '#377eb8', \


# NOTE the NA50 r lt 1esults come from 0612013 last column in Table 3, combined with
# di-muon deaclt 1 y widths from PDG: J/Psi=0.05961, Psi'=8e-3

EOF

latex "bb_width_T250_perp.tex"
dvips -o "bb_width_T250_perp.ps" "bb_width_T250_perp.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "bb_width_T250_perp.ps" "bb_width_T250_perp.pdf"
rm "bb_width_T250_perp.ps"
open "bb_width_T250_perp.pdf"
