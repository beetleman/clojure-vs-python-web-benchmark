FROM clojure:lein-2.7.1

RUN mkdir /app
ADD . /app
WORKDIR /app

RUN apt update && apt install -y wrk python3 python3-venv python3-matplotlib make bc
