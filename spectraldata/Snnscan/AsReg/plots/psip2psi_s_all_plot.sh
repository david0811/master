#!/bin/bash

gnuplot << EOF

set terminal epslatex size 9,5 standalone color colortext 10 font ',14'
set output "psip2psi_s_all.tex"

set border linewidth 5

#set style line 1 linecolor rgb '#4daf4a' linetype 1 linewidth 3
#set style line 2 linecolor rgb '#4daf4a' linetype 0 linewidth 3
#set style line 3 linecolor rgb '#984ea3' linetype 1 linewidth 3
#set style line 4 linecolor rgb '#984ea3' linetype 0 linewidth 3

set xlabel '\(\sqrt{s_{NN}}\;\left[\mathrm{GeV}\right]\)'
set ylabel 'Relative production \(\;\psi^\prime/J/\psi\)'

set label 'Statistical Hadronisation model' at graph 0.18, graph 0.24
set label 'This work' at graph 0.42, graph 0.19
set label 'p-p' at graph 0.19, graph 0.43

set xrange [7:12000]
set yrange [0:0.3]

set logscale x
set format x '\(10^{%L}\)'

set style fill transparent solid 0.5 noborder

set key top
set key spacing 1.3
#set key width -8

set arrow from 2760,0.046 to 2760,0 lw 5 lc rgb '#377eb8' head filled size screen 0.03,15,45 front

set arrow from 400,0.057 to 600,0.057 lw 6 lc rgb '#4daf4a' nohead size screen 0.03,15,45
set arrow from 400,0.072 to 600,0.072 lw 6 lc rgb '#984ea3' nohead size screen 0.03,15,45

plot "psip2psi_s_therm.dat" u 1:3:4 notitle w filledcurves lc rgb '#4daf4a', \
     "psip2psi_s_shm.dat" u 1:3:4 notitle w filledcurves lc rgb '#984ea3', \
     "" u 1:2 notitle w l lt 1 lw 6 lc rgb '#984ea3', \
     "psip2psi_s_therm.dat" u 1:2  notitle w l lt 1 lw 6 lc rgb '#4daf4a', \
     "psip2psi_s_NA50.dat" u 1:2:3:4 title 'NA50 Pb-Pb, \(\sqrt{s_{NN}}=0.017\;\mathrm{TeV}\), central, \(0<y<1\), \(p_T>0\;\mathrm{GeV}\)' w yerrorbars lt 8 lw 6 pointsize 2 lc rgb '#e41a1c', \
     "psip2psi_pp.dat" u 1:2:3:4 notitle w yerrorbars lt 6 lw 7 pointsize 2 lc rgb '#ff7f00', \
     "psip2psi_s_limit.dat" u 1:2 title 'ALICE Pb-Pb, \(\sqrt{s_{NN}}=0.017\;\mathrm{TeV}\), 0--20\%, \(2.5<y<4\), \(0<p_T<8\;\mathrm{GeV}\)' w l lt 6 lw 6 lc rgb '#377eb8', \
     "psip2psi_s_PbPb.dat" u 1:2:3:4 title 'CMS Pb-Pb, \(\sqrt{s_{NN}}=2.76\;\mathrm{TeV}\), 0--100\%, \(|y| <1.6\), \(6.5<p_T<30\;\mathrm{GeV}\)' w yerrorbars lt 5 lw 6 pointsize 2 lc rgb '#e41a1c', \
     "psip2psi_Pb_502TeV.dat" u 1:2:3:4 title 'CMS Pb-Pb, \(\sqrt{s_{NN}}=5.02\;\mathrm{TeV}\), 0--100\%, \(|y| <1.6\), \(6.5<p_T<30\;\mathrm{GeV}\)' w yerrorbars lt 4 lw 6 pointsize 2 lc rgb '#e41a1c', \


# NOTE the NA50 results come from 0612013 last column in Table 3, combined with
# di-muon decay widths from PDG: J/Psi=0.05961, Psi'=8e-3

EOF

latex "psip2psi_s_all.tex"
dvips -o "psip2psi_s_all.ps" "psip2psi_s_all.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "psip2psi_s_all.ps" "psip2psi_s_all.pdf"
rm "psip2psi_s_all.ps"
open "psip2psi_s_all.pdf"
