#!/usr/bin/env bash
for i in `ls -d *-app`
do
    cd $i

    echo $i |tee -a ../results.log

    lein clean
    lein uberjar
    java -jar ./target/uberjar/$i.jar &

    sleep 10
    echo "Warm up"
    wrk -t12 -c400 -d10s http://localhost:8080

    echo "benchmark:"| tee -a ../results.log
    wrk -t12 -c400 -d60s http://localhost:8080 | tee -a ../results.log
    for x in `jobs -p`; do kill -9 $x; done

    cd ..
done;
