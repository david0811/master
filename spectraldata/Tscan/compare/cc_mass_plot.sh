#!/bin/bash

gnuplot << EOF

set terminal cairolatex standalone size 7,5 font ',14'
set output "cc_mass.tex"

set lmargin 10
set bmargin 5

set border linewidth 1.5

set xlabel '\(T\;\left[\mathrm{GeV}\right]\)' offset 0,-1
set ylabel 'M\(\;\left[\mathrm{GeV}\right]\)' offset -2,0

set xrange [0.15:0.3]

set key at graph 0.9, graph 0.9     
set key spacing 2.5

set style fill transparent solid 0.5 noborder

plot "../AsReg/plots/cc_Econt.dat" u 1:3:4 notitle w filledcurves lc rgb 'light-gray', \
     "" u 1:2 title '\(E_{cont}\)' w l lt 1 lw 2 lc rgb 'light-gray', \
     "../Debye/plots/Jpsi_mass_Debye.dat" u 1:3:4 notitle w filledcurves fs transparent solid 0.2 lc rgb '#e41a1c', \
     "../Debye/plots/psip_mass_Debye.dat" u 1:3:4 notitle w filledcurves fs transparent solid 0.2 lc rgb '#377eb8', \
     "../AsReg/plots/Jpsi_mass.dat" u 1:3:4 notitle w filledcurves lc rgb '#e41a1c', \
     "" u 1:2 title '\(J/\psi\)' w l lt 1 lw 6 lc rgb '#e41a1c', \
     "../AsReg/plots/psip_mass.dat" u 1:3:4 notitle w filledcurves lc rgb '#377eb8', \
     "" u 1:2 title '\(\psi(2S)\)' w l lt 1 lw 6 lc rgb '#377eb8'
     


# NOTE the NA50 results come from 0612013 last column in Table 3, combined with
# di-muon deacy widths from PDG: J/Psi=0.05961, Psi'=8e-3

EOF

latex "cc_mass.tex"
dvips -o "cc_mass.ps" "cc_mass.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "cc_mass.ps" "cc_mass.pdf"
rm "cc_mass.ps"
open "cc_mass.pdf"