(ns catacumba-app.routes
  (:require [catacumba.core :as ct]
            [manifold.deferred :as d]
            [catacumba.http :as http]))


(defn str->int
  ([s]
   (str->int s 0))
  ([s default]
   (try
    (Integer/parseInt s)
    (catch Exception _ default))))


(defn hello-handler [ctx]
  (let [delay (-> ctx :query-params :delay str->int)
        result (d/future
                 (Thread/sleep delay)
                 "hello world")]
    result))

(defn routes [base]
  (ct/routes [
              [:get "" hello-handler]]))
