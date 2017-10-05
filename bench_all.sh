#!/usr/bin/env bash
for name in `ls -d *-app`
do
    cd $name

    echo $name |tee -a ../results.log

    lein clean
    lein uberjar
    java -jar ./target/uberjar/$name.jar &

    sleep 10

    echo "Warm up..."
    wrk -t12 -c400 -d10s http://localhost:8080/?delay=0

    for delay in 0 100 200 300 400 500 1000 2000
    do
        echo "benchmark [$delay ms]:"| tee -a ../results.log
        wrk -t12 -c400 -d60s http://localhost:8080/?delay=$delay | tee -a ../results.log
        echo "====================================="
        sleep 5
    done;
    for x in `jobs -p`; do kill -9 $x; done
    cd ..
done;
