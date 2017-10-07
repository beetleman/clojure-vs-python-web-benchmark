#!/usr/bin/env bash
for name in `ls -d *-app`
do

    echo $name |tee -a ./artifacts/results.log
    cd $name

    lein clean
    lein uberjar
    java -jar ./target/uberjar/$name.jar &
    cd ..

    sleep 10

    echo "Warm up..."
    wrk -t12 -c400 -d10s http://localhost:8080/?delay=0
    wrk -t12 -c400 -d10s http://localhost:8080/?delay=100

    for factor in 0 0.2 0.4 0.6 0.8 1 1.5 2 2.5 3
    do

        delay=`echo $factor*100/1 | bc`
        echo "benchmark [$delay ms]:"| tee -a ./artifacts/results.log

        TITLE=$name DELAY=$delay wrk \
             -t12 -c400 -d60s \
             -s ./report.lua \
             http://localhost:8080/?delay=$delay | tee -a ./artifacts/results.log

        echo "------------------------------------------"| tee -a ./artifacts/results.log
        echo | tee -a ./artifacts/results.log
        sleep 5
    done;

    for x in `jobs -p`; do kill -9 $x; done

    echo "=========================================="| tee -a ./artifacts/results.log
    echo | tee -a ./artifacts/results.log
    echo | tee -a ./artifacts/results.log

done;
