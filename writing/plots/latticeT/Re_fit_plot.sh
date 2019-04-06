#!/bin/bash

gnuplot << EOF

set terminal pdfcairo enhanced color size 7,7 font 'CMU Serif,45'
set output "Re_fit.pdf"

set encoding utf8

set border 3 linewidth 4
set tics nomirror

set arrow from graph 1,0 to graph 1.05,0 filled linewidth 4
set arrow from graph 0,1 to graph 0,1.05 filled linewidth 4

set xrange [0:1.8]
set xtics 0.5
set xtics offset 0,graph 0.03
set yrange [0:7.9]
set ytics 2

set label 'r [fm]' at graph 0.92,0.06
set label 'ReV [GeV]' at graph 0.02,1.05

set style fill transparent solid 0.3 noborder

plot "../../../mathematica/DL_form/reg_pot/ReVlatT1.dat" u 1:2:3 notitle w yerrorbars lt 7 lw 4 pointsize 1 lc rgb '#e41a1c',\
     "../../../mathematica/DL_form/reg_pot/ReVlatInterT1.dat" u 1:3:4 notitle w filledcurves lc rgb '#e41a1c', \
     "" u 1:2 notitle w l lt 1 lw 4 lc rgb '#e41a1c', \
     "../../../mathematica/DL_form/reg_pot/ReVlatT2.dat" u 1:2:3 notitle w yerrorbars lt 7 lw 4 pointsize 1 lc rgb '#377eb8',\
     "../../../mathematica/DL_form/reg_pot/ReVlatInterT2.dat" u 1:3:4 notitle w filledcurves lc rgb '#377eb8', \
     "" u 1:2 notitle w l lt 1 lw 4 lc rgb '#377eb8', \
     "../../../mathematica/DL_form/reg_pot/ReVlatT3.dat" u 1:2:3 notitle w yerrorbars lt 7 lw 4 pointsize 1 lc rgb '#4daf4a',\
     "../../../mathematica/DL_form/reg_pot/ReVlatInterT3.dat" u 1:3:4 notitle w filledcurves lc rgb '#4daf4a', \
     "" u 1:2 notitle w l lt 1 lw 4 lc rgb '#4daf4a', \
     "../../../mathematica/DL_form/reg_pot/ReVlatT4.dat" u 1:2:3 notitle w yerrorbars lt 7 lw 4 pointsize 1 lc rgb '#984ea3',\
     "../../../mathematica/DL_form/reg_pot/ReVlatInterT4.dat" u 1:3:4 notitle w filledcurves lc rgb '#984ea3', \
     "" u 1:2 notitle w l lt 1 lw 4 lc rgb '#984ea3', \
     "../../../mathematica/DL_form/reg_pot/ReVlatT5.dat" u 1:2:3 notitle w yerrorbars lt 7 lw 4 pointsize 1 lc rgb '#ff7f00',\
     "../../../mathematica/DL_form/reg_pot/ReVlatInterT5.dat" u 1:3:4 notitle w filledcurves lc rgb '#ff7f00', \
     "" u 1:2 notitle w l lt 1 lw 4 lc rgb '#ff7f00', \
     "../../../mathematica/DL_form/reg_pot/ReVlatT6.dat" u 1:2:3 notitle w yerrorbars lt 7 lw 4 pointsize 1 lc rgb '#a65628',\
     "../../../mathematica/DL_form/reg_pot/ReVlatInterT6.dat" u 1:3:4 notitle w filledcurves lc rgb '#a65628', \
     "" u 1:2 notitle w l lt 1 lw 4 lc rgb '#a65628', \
     "../../../mathematica/DL_form/reg_pot/ReVlatT7.dat" u 1:2:3 notitle w yerrorbars lt 7 lw 4 pointsize 1 lc rgb '#f781bf',\
     "../../../mathematica/DL_form/reg_pot/ReVlatInterT7.dat" u 1:3:4 notitle w filledcurves lc rgb '#f781bf', \
     "" u 1:2 notitle w l lt 1 lw 4 lc rgb '#f781bf',\
     "../../../mathematica/DL_form/reg_pot/ReVlatT01.dat" u 1:2:3 notitle w yerrorbars lt 7 lw 4 pointsize 1 lc rgb '#999999',\
     "../../../mathematica/DL_form/reg_pot/ReVlatInterT01.dat" u 1:3:4 notitle w filledcurves lc rgb '#999999', \
     "" u 1:2 notitle w l lt 1 lw 4 lc rgb '#999999',\
     "../../../mathematica/DL_form/reg_pot/ReVlatT02.dat" u 1:2:3 notitle w yerrorbars lt 7 lw 4 pointsize 1 lc rgb '#999999',\
     "../../../mathematica/DL_form/reg_pot/ReVlatInterT02.dat" u 1:3:4 notitle w filledcurves lc rgb '#999999', \
     "" u 1:2 notitle w l lt 1 lw 4 lc rgb '#999999'

EOF

open "Re_fit.pdf"
