(ns catacumba-app.routes
  (:require [catacumba.core :as ct]
            [manifold.deferred :as d]
            [catacumba.http :as http]))


(defn hello-handler [context]
  (let [result (d/future
                 (Thread/sleep 1000)
                 "hello world")]
    result))

(defn routes [base]
  (ct/routes [
              [:get "" hello-handler]]))
