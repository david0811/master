#!/bin/bash

gnuplot << EOF

set terminal epslatex size 8,6 standalone color colortext 10 font ',20'
set output "Tmu_mD_plot.tex"

set border linewidth 5
set style line 1 linecolor rgb '#4daf4a' linetype 1 linewidth 10
set style line 2 linecolor rgb '#377eb8' linetype 1 linewidth 10
set style line 3 linecolor rgb '#984ea3' linetype 1 linewidth 10

set xlabel '\(\sqrt{s_{NN}}\;\left[\mathrm{GeV}\right]\)'
set ylabel '\(\left[\mathrm{GeV}\right]\)' offset 1,0

set key at graph 0.9, graph 0.4
set key samplen 2

set xrange [2:12000]
set yrange [-.01:0.3]

set logscale x
set format x '\(10^{%L}\)'

set key spacing 1.4

f(x) = (x > 3 && x <= 10000) ? 0.1584/(1+exp(2.6-log(x)/0.45)) : 1/0
g(x) = (x > 3 && x <= 10000) ? 1.3075/(1+0.288*x) : 1/0

plot f(x) title '\(T\)' w l ls 1, \
     g(x) title '\(\mu_B\)' w l ls 2, \
     "s_md_error.dat" using 1:2 title '\(m_D\)' w l ls 3

EOF

latex "Tmu_mD_plot.tex"
dvips -o "Tmu_mD_plot.ps" "Tmu_mD_plot.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "Tmu_mD_plot.ps" "Tmu_mD_plot.pdf"
rm "Tmu_mD_plot.ps"
open "Tmu_mD_plot.pdf"
