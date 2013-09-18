# 
# plot.gp
# 
# This gnuplot script generates a plot given the
# output of montecarlo.f. See README for more details.
#


set grid lc rgbcolor "#CCCCCC"
set size 0.7, 0.8
set border lw 1.5
set tics scale 1.5

set xrange [-0.1:1.1]
set xtics 0.2
set xlabel ""

set yrange [-0.1:1.1]
set ytics 0.2
set ylabel ""


set terminal postscript eps enhanced "Helvetica" 20
set output '| epstopdf --filter --outfile=Plotcircle.pdf'


plot 'circulo_in.data' notitle w points lc 3 pt 7, \
     'circulo_out.data' notitle w points lc 1 pt 7, \
     sqrt(1-x**2) notitle w line lc 0 lw 3