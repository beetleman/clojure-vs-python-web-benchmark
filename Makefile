tag = clojure-web-benchmark
volumes = $(shell pwd)/artifacts:/app/artifacts
run = docker run -v $(volumes) -it $(tag)

dirs:
	mkdir -p artifacts/plots
docker-img:
	docker build -t $(tag) .
artifacts/results.csv: docker-img dirs
	$(run) ./bench_all.sh
plots: artifacts/results.csv docker-img dirs
	$(run) python3 generate_plots.py
clean:
	$(run) rm -rf artifacts/*
