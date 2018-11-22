#!/bin/bash

gnuplot << EOF

set terminal epslatex size 7,5 standalone color colortext 10 font ',14'
set output "cc_mass_T150_perp.tex"

set border linewidth 1.5

set xlabel '\(v_{\perp}\)' 
set ylabel '\(M\;\left[\mathrm{GeV}\right]\)'

set key at graph 0.9, graph 0.4

set key spacing 1.5

set style fill transparent solid 0.5 noborder

plot "../data/Jpsi_mass_T150_perp.dat" u 1:3:4 notitle w filledcurves lc rgb '#4daf4a', \
     "" u 1:2 title '\(J/\psi\)' w l lt 1 lw 4 lc rgb '#4daf4a', \
     "../data/psip_mass_T150_perp.dat" u 1:3:4 notitle w filledcurves lc rgb '#984ea3', \
     "" u 1:2 title '\(\psi(2S)\)' w l lt 1 lw 4 lc rgb '#984ea3'


# NOTE the NA50 r lt 1esults come from 0612013 last column in Table 3, combined with
# di-muon deaclt 1 y widths from PDG: J/Psi=0.05961, Psi'=8e-3

EOF

latex "cc_mass_T150_perp.tex"
dvips -o "cc_mass_T150_perp.ps" "cc_mass_T150_perp.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "cc_mass_T150_perp.ps" "cc_mass_T150_perp.pdf"
rm "cc_mass_T150_perp.ps"
open "cc_mass_T150_perp.pdf"
