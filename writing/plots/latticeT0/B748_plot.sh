#!/bin/bash

gnuplot << EOF

set terminal pdfcairo enhanced color size 7,5 font 'CMU Serif,50'
set output 'lattice_B748.pdf'

set border 3 linewidth 1.5

#set style line 1 linecolor rgb '#4daf4a' linetype 1 linewidth 3
#set style line 2 linecolor rgb '#4daf4a' linetype 0 linewidth 3
#set style line 3 linecolor rgb '#984ea3' linetype 1 linewidth 3 
#set style line 4 linecolor rgb '#984ea3' linetype 0 linewidth 3 

set xlabel 'r [fm]' offset 0,1
set ylabel 'ReV [GeV]' offset 1,0 

set xrange[0.01:1]
set yrange [0:4]

set xtics offset 0, graph 0.05 nomirror 0,0.2,1
set ytics nomirror

set style fill transparent solid 0.4 noborder

plot "B748PotVals.dat" u 1:3:4 notitle w filledcurves lc rgb '#377eb8',\
     "B748PotVals.dat" u 1:2 notitle w l lw 5 lc rgb '#377eb8',\
     "latticeT71MeVBeta748.dat" using 1:2:3 notitle w yerrorbars pointsize 0.75 lt 7 lw 2 lc rgb '#e41a1c'


# NOTE the NA50 r lt 1esults come from 0612013 last column in Table 3, combined with
# di-muon deaclt 1 y widths from PDG: J/Psi=0.05961, Psi'=8e-3

EOF

open "lattice_B748.pdf"
