#!/bin/bash

gnuplot << EOF

set terminal epslatex size 8,6 standalone color colortext 10 font ',20'
set output "Tmu_mD_plot.tex"

set border linewidth 1.5
# Set first two line styles to blue (#0060ad) and red (#dd181f)
set style line 1 linecolor rgb '#e41a1c' linetype 1 linewidth 6
set style line 2 linecolor rgb '#377eb8' linetype 1 linewidth 6 
set style line 3 linecolor rgb '#4daf4a' linetype 1 linewidth 6 

set xlabel '\(\sqrt{s_{NN}}\;\left[\mathrm{GeV}\right]\)'
set ylabel '\(\left[\mathrm{GeV}\right]\)'

set key at graph 0.9, graph 0.4

set xrange [2:12000]
set yrange [-.01:0.3]

set logscale x
set format x '\(10^{%L}\)'

f(x) = (x > 3 && x <= 10000) ? 0.1584/(1+exp(2.6-log(x)/0.45)) : 1/0
g(x) = (x > 3 && x <= 10000) ? 1.3075/(1+0.288*x) : 1/0

# set style fill transparent solid 0.2 noborder

#plot "s_md_error.dat" using 1:3:4 title "" with filledcurves, \


# Plot
plot f(x) title '\(T_{\mathrm{chem}}\)' w l ls 1, \
     g(x) title '\(\mu_{\mathrm{chem}}\)' w l ls 2, \
     "s_md_error.dat" using 1:2 title '\(m_D\)' w l ls 3


EOF

latex "Tmu_mD_plot.tex"
dvips -o "Tmu_mD_plot.ps" "Tmu_mD_plot.dvi"
rm *.dvi *.aux *.log
rm *.tex *.eps
ps2pdf -dEPSCrop "Tmu_mD_plot.ps" "Tmu_mD_plot.pdf"
rm "Tmu_mD_plot.ps"
open "Tmu_mD_plot.pdf"