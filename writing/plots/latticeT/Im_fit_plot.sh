#!/bin/bash

gnuplot << EOF

set terminal pdfcairo enhanced color size 7,7 font 'CMU Serif,45'
set output "Im_fit.pdf"

set encoding utf8

set border 3 linewidth 4
set tics nomirror

set arrow from graph 1,0 to graph 1.05,0 filled linewidth 4
set arrow from graph 0,1 to graph 0,1.05 filled linewidth 4

set xrange [0:7.9]
set xtics 1
set xtics offset 0,graph 0.03
set yrange [0:0.5]
set ytics 0.1

set label 'r [fm]' at graph 0.95,0.06
set label 'ImV [GeV]' at graph 0.02,1.05

set style fill transparent solid 0.3 noborder

set key opaque
set key horizontal
set key samplen 1
set key width 1
set key at graph 1.02,graph 1.01

plot "../../../mathematica/DL_form/reg_pot/ImVlatT1.dat" u 1:2:3 title "148 MeV" w yerrorbars lt 7 lw 4 pointsize 1 lc rgb '#5e3c99',\
     "../../../mathematica/DL_form/reg_pot/ImVlatInterT1.dat" u 1:3:4 notitle w filledcurves lc rgb '#5e3c99', \
     "" u 1:2 notitle w l lt 1 lw 4 lc rgb '#5e3c99', \
     "../../../mathematica/DL_form/reg_pot/ImVlatT2.dat" u 1:2:3 title "164 MeV" w yerrorbars lt 7 lw 4 pointsize 1 lc rgb '#225ea8',\
     "../../../mathematica/DL_form/reg_pot/ImVlatInterT2.dat" u 1:3:4 notitle w filledcurves lc rgb '#225ea8', \
     "" u 1:2 notitle w l lt 1 lw 4 lc rgb '#225ea8', \
     "../../../mathematica/DL_form/reg_pot/ImVlatT3.dat" u 1:2:3 title "181 MeV" w yerrorbars lt 7 lw 4 pointsize 1 lc rgb '#41b6c4',\
     "../../../mathematica/DL_form/reg_pot/ImVlatInterT3.dat" u 1:3:4 notitle w filledcurves lc rgb '#41b6c4', \
     "" u 1:2 notitle w l lt 1 lw 4 lc rgb '#41b6c4', \
     "../../../mathematica/DL_form/reg_pot/ImVlatT4.dat" u 1:2:3 title "205 MeV" w yerrorbars lt 7 lw 4 pointsize 1 lc rgb '#a1dab4',\
     "../../../mathematica/DL_form/reg_pot/ImVlatInterT4.dat" u 1:3:4 notitle w filledcurves lc rgb '#a1dab4', \
     "" u 1:2 notitle w l lt 1 lw 4 lc rgb '#a1dab4', \
     "../../../mathematica/DL_form/reg_pot/ImVlatT5.dat" u 1:2:3 title "232 MeV" w yerrorbars lt 7 lw 4 pointsize 1 lc rgb '#fecc5c',\
     "../../../mathematica/DL_form/reg_pot/ImVlatInterT5.dat" u 1:3:4 notitle w filledcurves lc rgb '#fecc5c', \
     "" u 1:2 notitle w l lt 1 lw 4 lc rgb '#fecc5c', \
     "../../../mathematica/DL_form/reg_pot/ImVlatT6.dat" u 1:2:3 title "242 MeV" w yerrorbars lt 7 lw 4 pointsize 1 lc rgb '#fd8d3c',\
     "../../../mathematica/DL_form/reg_pot/ImVlatInterT6.dat" u 1:3:4 notitle w filledcurves lc rgb '#fd8d3c', \
     "" u 1:2 notitle w l lt 1 lw 4 lc rgb '#fd8d3c', \
     "../../../mathematica/DL_form/reg_pot/ImVlatT7.dat" u 1:2:3 title "286 MeV" w yerrorbars lt 7 lw 4 pointsize 1 lc rgb '#e31a1c',\
     "../../../mathematica/DL_form/reg_pot/ImVlatInterT7.dat" u 1:3:4 notitle w filledcurves lc rgb '#e31a1c', \
     "" u 1:2 notitle w l lt 1 lw 4 lc rgb '#e31a1c'

EOF

open "Im_fit.pdf"
