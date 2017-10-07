#!/usr/bin/env bash
run_wrk=wrk -t12 -c1000 -d30s -H "Connection: keep-alive"

for name in `ls -d *-app`
do

    echo $name |tee -a ./artifacts/results.log
    cd $name
    if [ -f "runIt" ]; then
        . runIt
    else
        lein clean
        lein uberjar
        java -jar ./target/uberjar/$name.jar &
    fi
    cd ..

    sleep 10

    echo "Warm up..."
    $run_wrk http://localhost:8080/?delay=1

    for factor in 0 0.2 0.4 0.6 0.8 1 1.5 2 2.5 3
    do

        delay=`echo $factor*100/1 | bc`
        echo "benchmark [$delay ms]:"| tee -a ./artifacts/results.log

        TITLE=$name DELAY=$delay $run_wrk
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
