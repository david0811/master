set terminal cairolatex standalone size 10,4 font ',20'
set output "spectra_ex.tex"

set lmargin 10
set bmargin 5

set border linewidth 5

set xrange [2.8:3.75]
set xtics 0.25
set yrange [0:21]
set ytics 3

set key at graph 0.95,0.8
set key spacing 2
set key samplen 2

set xlabel '\(\omega\;\left[\mathrm{GeV}\right]\)' offset 0,-1
set ylabel '\(-\rho^{V}\!\left(\omega\right)/\omega^2\)' offset -2,0

plot "swcc_u0spectra.dat" u 1:2 title '\(v=0.00\)' w l lt 1 lw 10 lc rgb '#999999',\
     "swcc_u50spectra.dat" u 1:2 title '\(v=0.50\)' w l lt 1 lw 10 lc rgb '#377eb8',\
     "swcc_u90spectra.dat" u 1:2 title '\(v=0.90\)' w l lt 1 lw 10 lc rgb '#984ea3',\
     "swcc_u99spectra.dat" u 1:2 title '\(v=0.99\)' w l lt 1 lw 10 lc rgb '#e41a1c'
