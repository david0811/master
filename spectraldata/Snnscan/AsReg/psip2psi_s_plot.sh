#!/bin/bash

gnuplot << EOF

set terminal epslatex size 7,5 standalone color colortext 10
set output "psip2psi_s.tex"

set border linewidth 1.5

#set style line 1 linecolor rgb '#4daf4a' linetype 1 linewidth 3
#set style line 2 linecolor rgb '#4daf4a' linetype 0 linewidth 3
#set style line 3 linecolor rgb '#984ea3' linetype 1 linewidth 3 
#set style line 4 linecolor rgb '#984ea3' linetype 0 linewidth 3 

set xlabel '\(\sqrt{s_{NN}}\;\left[\mathrm{GeV}\right]\)'
set ylabel 'Relative production \(\psi(2S)/J/\psi\)'

set label 'Pb-Pb' at graph 0.1, graph 0.5

set key at graph 0.7, graph 0.45

set xrange [10:12000]
set yrange [0.:0.05]

set logscale x
set format x '\(10^{%L}\)'

#plot "psip2psi_s_therm.dat" u 1:2 title 'This work' w l ls 1, \
#     "" u 1:3 notitle w l ls 2, \
#     "" u 1:4 notitle w l ls 2, \
#     "psip2psi_s_shm.dat" u 1:2 title 'Statistical hadronisation model' w l ls 3, \
#     "" u 1:3 notitle w l ls 4, \
#     "" u 1:4 notitle w l ls 4, \
#     

set style fill transparent solid 0.5 noborder

plot "psip2psi_s_therm.dat" u 1:3:4 notitle w filledcurves lc rgb '#4daf4a', \
     "psip2psi_s_shm.dat" u 1:3:4 notitle w filledcurves lc rgb '#984ea3', \
     "" u 1:2 title 'Statistical hadronisation model' w l lt 1 lw 4 lc rgb '#984ea3', \
     "psip2psi_s_therm.dat" u 1:2 title 'This work' w l lt 1 lw 4 lc rgb '#4daf4a', \
     "psip2psi_s_NA50.dat" u 1:2:3:4 notitle w yerrorbars lw 3 pointsize 2 lc rgb '#e41a1c'


# NOTE the NA50 results come from 0612013 last column in Table 3, combined with
# di-muon deacy widths from PDG: J/Psi=0.05961, Psi'=8e-3

EOF

latex "psip2psi_s.tex"
dvips -o "psip2psi_s.ps" "psip2psi_s.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "psip2psi_s.ps" "psip2psi_s.pdf"
rm "psip2psi_s.ps"
open "psip2psi_s.pdf"
