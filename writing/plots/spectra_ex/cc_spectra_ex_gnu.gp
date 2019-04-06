set terminal cairolatex standalone size 10,4 font ',20'
set output "cc_spectra_ex.tex"

set lmargin 10
set bmargin 5

set border linewidth 5

set xrange [2.3:4.25]
set xtics 0.5
set yrange [0:8]
set ytics 2

set key at graph 0.9,0.9
set key spacing 2
set key samplen 2

set xlabel '\(\omega\;\left[\mathrm{GeV}\right]\)' offset 0,-1
set ylabel '\(-\rho^{V}\!\left(\omega\right)/\omega^2\)' offset -2,0

plot "../../../spectraldata/Tscan/AsReg/cc/swccT155spectra.dat" u 1:(-$2) title '\(155\;\mathrm{MeV}\)' w l lt 1 lw 10 lc rgb '#e41a1c',\
     "../../../spectraldata/Tscan/AsReg/cc/swccT174spectra.dat" u 1:(-$2) title '\(175\;\mathrm{MeV}\)' w l lt 1 lw 10 lc rgb '#377eb8',\
     "../../../spectraldata/Tscan/AsReg/cc/swccT201spectra.dat" u 1:(-$2) title '\(200\;\mathrm{MeV}\)' w l lt 1 lw 10 lc rgb '#4daf4a',\
     "../../../spectraldata/Tscan/AsReg/cc/swccT249spectra.dat" u 1:(-$2) title '\(250\;\mathrm{MeV}\)' w l lt 1 lw 10 lc rgb '#984ea3',\
     "../../../spectraldata/Tscan/AsReg/cc/swccT300spectra.dat" u 1:(-$2) title '\(300\;\mathrm{MeV}\)' w l lt 1 lw 10 lc rgb '#ff7f00'
