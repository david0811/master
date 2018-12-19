#!/bin/bash

gnuplot << EOF

set terminal pdfcairo enhanced color size 7,5 font 'CMU Serif,25'
set output "Im_fit.pdf"

set lmargin 10
set bmargin 4

set encoding utf8

set border linewidth 1.5

set yrange [0:0.5]

set xlabel 'r [fm]' 
set ylabel '[GeV]'

set key at graph 0.8, graph 0.3     
set key spacing 1

set style fill transparent solid 0.3 noborder

plot "../../../mathematica/DL_form/reg_pot/ImVlatT1.dat" u 1:2:3 notitle w yerrorbars lt 7 lw 3 pointsize 1 lc rgb '#e41a1c',\
     "../../../mathematica/DL_form/reg_pot/ImVlatInterT1.dat" u 1:3:4 notitle w filledcurves lc rgb '#e41a1c', \
     "" u 1:2 notitle w l lt 1 lw 2 lc rgb '#e41a1c', \
     "../../../mathematica/DL_form/reg_pot/ImVlatT2.dat" u 1:2:3 notitle w yerrorbars lt 7 lw 3 pointsize 1 lc rgb '#377eb8',\
     "../../../mathematica/DL_form/reg_pot/ImVlatInterT2.dat" u 1:3:4 notitle w filledcurves lc rgb '#377eb8', \
     "" u 1:2 notitle w l lt 1 lw 2 lc rgb '#377eb8', \
     "../../../mathematica/DL_form/reg_pot/ImVlatT3.dat" u 1:2:3 notitle w yerrorbars lt 7 lw 3 pointsize 1 lc rgb '#4daf4a',\
     "../../../mathematica/DL_form/reg_pot/ImVlatInterT3.dat" u 1:3:4 notitle w filledcurves lc rgb '#4daf4a', \
     "" u 1:2 notitle w l lt 1 lw 2 lc rgb '#4daf4a', \
     "../../../mathematica/DL_form/reg_pot/ImVlatT4.dat" u 1:2:3 notitle w yerrorbars lt 7 lw 3 pointsize 1 lc rgb '#984ea3',\
     "../../../mathematica/DL_form/reg_pot/ImVlatInterT4.dat" u 1:3:4 notitle w filledcurves lc rgb '#984ea3', \
     "" u 1:2 notitle w l lt 1 lw 2 lc rgb '#984ea3', \
     "../../../mathematica/DL_form/reg_pot/ImVlatT5.dat" u 1:2:3 notitle w yerrorbars lt 7 lw 3 pointsize 1 lc rgb '#ff7f00',\
     "../../../mathematica/DL_form/reg_pot/ImVlatInterT5.dat" u 1:3:4 notitle w filledcurves lc rgb '#ff7f00', \
     "" u 1:2 notitle w l lt 1 lw 2 lc rgb '#ff7f00', \
     "../../../mathematica/DL_form/reg_pot/ImVlatT6.dat" u 1:2:3 notitle w yerrorbars lt 7 lw 3 pointsize 1 lc rgb '#a65628',\
     "../../../mathematica/DL_form/reg_pot/ImVlatInterT6.dat" u 1:3:4 notitle w filledcurves lc rgb '#a65628', \
     "" u 1:2 notitle w l lt 1 lw 2 lc rgb '#a65628', \
     "../../../mathematica/DL_form/reg_pot/ImVlatT7.dat" u 1:2:3 notitle w yerrorbars lt 7 lw 3 pointsize 1 lc rgb '#f781bf',\
     "../../../mathematica/DL_form/reg_pot/ImVlatInterT7.dat" u 1:3:4 notitle w filledcurves lc rgb '#f781bf', \
     "" u 1:2 notitle w l lt 1 lw 2 lc rgb '#f781bf'

EOF

open "Im_fit.pdf"

