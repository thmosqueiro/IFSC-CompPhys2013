set grid lc rgbcolor "#CCCCCC"
set size 0.7, 0.8
set border lw 2
set tics scale 1.5

set xrange [0.769:0.799]
set xlabel "Fraction of vectors inside circle"
set format x "%3.2f"
set xtics 0.008

set style fill solid 0.5

set yrange [-5:105]
set ylabel "Frequency"
set format y "%3.0f"


binwidth=0.002
bin(x,width)=width*floor(x/width)


set title "Result with a lot of vectors"

set terminal postscript eps enhanced "Helvetica" 20
set output '| epstopdf --filter --outfile=fractions_histogram_highsample.pdf'

plot 'saida_fracoes.data' using (bin($1,binwidth)):(1.0) smooth freq with boxes notitle lw 4 lc 3





set xrange [0.61:0.94]
set xlabel "Fraction of vectors inside circle"
set format x "%3.2f"
set xtics 0.05

set style fill solid 0.5

set yrange [-100:1100]
set ylabel "Frequency"
set format y "%3.0f"


set title "Result with few vectors"

set terminal postscript eps enhanced "Helvetica" 20
set output '| epstopdf --filter --outfile=fractions_histogram_poorsample.pdf'

plot 'saida_fracoes_poor.data' using (bin($1,binwidth)):(1.0) smooth freq with boxes notitle lw 4 lc 3