set terminal canvas jsdir ""
set output "/home/mei/genome-analysis/analyses/02_genome_assembly/quast_evaluation/contigs_reports/nucmer_output/durioz-pilon.html"
set ytics ( \
 "0" 0, \
 "4000000" 4000000, \
 "8000000" 8000000, \
 "12000000" 12000000, \
 "16000000" 16000000, \
 "20000000" 20000000, \
 "24000000" 24000000, \
 "28000000" 28000000, \
 "" 29794825 \
)
set size 1,1
set grid
set key outside bottom right
set border 0
set tics scale 0
set xlabel "Reference" noenhanced
set ylabel "Assembly" noenhanced
set format "%.0f"
set xrange [1:*]
set yrange [1:29794825]
set linestyle 1  lt 1 lc rgb "red" lw 3 pt 7 ps 0.5
set linestyle 2  lt 3 lc rgb "blue" lw 3 pt 7 ps 0.5
set linestyle 3  lt 2 lc rgb "yellow" lw 3 pt 7 ps 0.5
plot \
 "/home/mei/genome-analysis/analyses/02_genome_assembly/quast_evaluation/contigs_reports/nucmer_output/durioz-pilon.fplot" title "FWD" w lp ls 1, \
 "/home/mei/genome-analysis/analyses/02_genome_assembly/quast_evaluation/contigs_reports/nucmer_output/durioz-pilon.rplot" title "REV" w lp ls 2
