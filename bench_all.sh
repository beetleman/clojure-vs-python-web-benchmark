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
    wrk -t12 -c400 -d10s http://localhost:8080/?delay=100

    for factor in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
    do
        delay=$(($factor * 100))
        echo "benchmark [$delay ms]:"| tee -a ../results.log

        TITLE=$name DELAY=$delay wrk \
             -t12 -c400 -d60s \
             -s ../report.lua \
             http://localhost:8080/?delay=$delay | tee -a ../results.log

        echo "------------------------------------------"| tee -a ../results.log
        echo | tee -a ../results.log
        sleep 5
    done;

    for x in `jobs -p`; do kill -9 $x; done

    echo "=========================================="| tee -a ../results.log
    echo | tee -a ../results.log
    echo | tee -a ../results.log

    cd ..
done;

cat *-app/*.csv > report.csv
