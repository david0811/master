#!/bin/bash

gnuplot << EOF

set terminal cairolatex standalone size 10,5 font ',20'
set output "bb_spectra_ex.tex"

set lmargin 10
set bmargin 5

set border linewidth 1.5

set xrange [8.765:11]
set yrange [0:-5]

set key at graph 0.9,0.9
set key spacing 2

set title 'Bottomonium \(^3S_1\) spectra'

set xlabel '\(\omega\;\left[\mathrm{GeV}\right]\)' offset 0,-1
set ylabel '\(\rho^{V}\left(\omega\right)/\omega^2\)' offset -1.5,0

plot "../../../spectraldata/Tscan/AsReg/bb/swbbT155spectra.dat" u 1:2 title '\(T=155\;\mathrm{MeV}\)' w l lt 1 lw 4 lc rgb '#e41a1c',\
     "../../../spectraldata/Tscan/AsReg/bb/swbbT200spectra.dat" u 1:2 title '\(T=200\;\mathrm{MeV}\)' w l lt 1 lw 4 lc rgb '#377eb8',\
     "../../../spectraldata/Tscan/AsReg/bb/swbbT300spectra.dat" u 1:2 title '\(T=300\;\mathrm{MeV}\)' w l lt 1 lw 4 lc rgb '#4daf4a',\
     "../../../spectraldata/Tscan/AsReg/bb/swbbT400spectra.dat" u 1:2 title '\(T=400\;\mathrm{MeV}\)' w l lt 1 lw 4 lc rgb '#984ea3',\
     "../../../spectraldata/Tscan/AsReg/bb/swbbT500spectra.dat" u 1:2 title '\(T=500\;\mathrm{MeV}\)' w l lt 1 lw 4 lc rgb '#ff7f00',\
     "../../../spectraldata/Tscan/AsReg/bb/swbbT600spectra.dat" u 1:2 title '\(T=600\;\mathrm{MeV}\)' w l lt 1 lw 4 lc rgb '#a65628'


# NOTE the NA50 results come from 0612013 last column in Table 3, combined with
# di-muon deacy widths from PDG: J/Psi=0.05961, Psi'=8e-3

EOF

latex "bb_spectra_ex.tex"
dvips -o "bb_spectra_ex.ps" "bb_spectra_ex.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "bb_spectra_ex.ps" "bb_spectra_ex.pdf"
rm "bb_spectra_ex.ps"
open "bb_spectra_ex.pdf"