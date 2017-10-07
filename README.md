# clojure-vs-python-web-benchmark
Benchmark for hello-world app written in luminus(immutant2), yada(aleph), catacumba(ratpack), flask and aiohttp
more information awialable on my [blog]

## Requiments
- docker
- make

## Plots

Generate new plots on own machine (IT WILL TAKE ABOUT 1H)

```bash
make clean
make plots
```

## plots

![alt text](https://github.com/beetleman/clojure-vs-python-web-benchmark/blob/master/artifacts/plots/requests_per_sec.png "Requests per second")
![alt text](https://github.com/beetleman/clojure-vs-python-web-benchmark/blob/master/artifacts/plots/transfer.png "Transfer")
![alt text](https://github.com/beetleman/clojure-vs-python-web-benchmark/blob/master/artifacts/plots/latency.png "Latency")
![alt text](https://github.com/beetleman/clojure-vs-python-web-benchmark/blob/master/artifacts/plots/all_errors.png "All errors")

[blog]: https://beetleman.github.io
