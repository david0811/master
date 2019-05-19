set terminal cairolatex standalone size 10,4 font ',20'
set output "bb_spectra_ex.tex"

set lmargin 10
set bmargin 5

set border linewidth 5

set xrange [8.765:11]
set xtics 0.5
set yrange [0:3]
set ytics 1

set key at graph 0.95,0.8
set key spacing 2
set key samplen 2

set arrow from 9.46030,0 to 9.46030,3 nohead lt 1 dt 2 lw 10 lc rgb '#999999'
set arrow from 10.02326,0 to 10.02326,3 nohead lt 1 dt 2 lw 10 lc rgb '#999999'
set arrow from 10.3552,0 to 10.3552,3 nohead lt 1 dt 2 lw 10 lc rgb '#999999'

#set title 'Bottomonium \(^3S_1\) spectra'

set xlabel '\(\omega\;\left[\mathrm{GeV}\right]\)' offset 0,-1
set ylabel '\(-\rho^{V}\!\left(\omega\right)/\omega^2\)' offset -2,0

plot "../../../spectraldata/Tscan/AsReg/bb/swbbT155spectra.dat" u 1:(-$2) title '\(155\;\mathrm{MeV}\)' w l lt 1 lw 10 lc rgb '#4575b4',\
     "../../../spectraldata/Tscan/AsReg/bb/swbbT200spectra.dat" u 1:(-$2) title '\(200\;\mathrm{MeV}\)' w l lt 1 lw 10 lc rgb '#7fbf7b',\
     "../../../spectraldata/Tscan/AsReg/bb/swbbT300spectra.dat" u 1:(-$2) title '\(300\;\mathrm{MeV}\)' w l lt 1 lw 10 lc rgb '#fee090',\
     "../../../spectraldata/Tscan/AsReg/bb/swbbT400spectra.dat" u 1:(-$2) title '\(400\;\mathrm{MeV}\)' w l lt 1 lw 10 lc rgb '#fc8d59',\
     "../../../spectraldata/Tscan/AsReg/bb/swbbT500spectra.dat" u 1:(-$2) title '\(500\;\mathrm{MeV}\)' w l lt 1 lw 10 lc rgb '#d73027'
