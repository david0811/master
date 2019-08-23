#!/bin/bash

gnuplot << EOF

set terminal epslatex size 7,5 standalone color colortext 10 font ',20'
set output "pT_v.tex"

set border linewidth 5

set xlabel '\(\varphi\)'
set ylabel '\(v\)'

set xrange [0:3.14159]
set ytics 0.25
set ylabel offset 1,0

set key samplen 2

set key at graph 0.95, graph 0.7
set key spacing 1.4

plot "v_pT_2.dat" u 1:2 title '\(p_T =2~\mathrm{GeV}\)' w l lw 10 lc rgb '#9970ab',\
     "v_pT_5.dat" u 1:2 title '\(p_T =5~\mathrm{GeV}\)' w l lw 10 lc rgb '#8da0cb',\
     "v_pT_10.dat" u 1:2 title '\(p_T =10~\mathrm{GeV}\)' w l lw 10 lc rgb '#66c2a5',\
     "v_pT_15.dat" u 1:2 title '\(p_T =15~\mathrm{GeV}\)' w l lw 10 lc rgb '#a6d854',\
     "v_pT_20.dat" u 1:2 title '\(p_T =20~\mathrm{GeV}\)' w l lw 10 lc rgb '#ff7f00',\
     "v_pT_25.dat" u 1:2 title '\(p_T =25~\mathrm{GeV}\)' w l lw 10 lc rgb '#e41a1c'

EOF

latex "pT_v.tex"
dvips -o "pT_v.ps" "pT_v.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "pT_v.ps" "pT_v.pdf"
rm "pT_v.ps"
open "pT_v.pdf"
