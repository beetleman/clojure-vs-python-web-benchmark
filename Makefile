tag = clojure-web-benchmark
volumes = $(shell pwd)/artifacts:/app/artifacts
run = docker run -v $(volumes) -it $(tag)

docker-img:
	docker build -t $(tag) .
artifacts/results.csv: docker-img
	$(run) ./bench_all.sh
plots: artifacts/results.csv docker-img
	$(run) python3 generate_plots.py
clean:
	$(run) rm -rf artifacts/*
