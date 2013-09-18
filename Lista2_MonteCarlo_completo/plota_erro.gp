set grid lc rgbcolor "#CCCCCC"
set size 0.7, 0.8
set border lw 2
set tics scale 1.5

#set xrange [-0.1:1.1]
set xlabel "Number of trials"
set format x "10^{%L}"

#set yrange [-0.1:1.1]
set ylabel "Average error"
set format y "10^{%L}"
set log xy


set terminal postscript eps enhanced "Helvetica" 20
set output '| epstopdf --filter --outfile=Average_error.pdf'


plot 'erro_medio.data' notitle w points lc 0 pt 7 ps 1