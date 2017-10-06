results.csv:
	./bench_all.sh
plots: results.csv
	python3 generate_plots.py
clean:
	rm -rf *.csv *.log plots/*
