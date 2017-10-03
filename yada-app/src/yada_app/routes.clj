(ns yada-app.routes
  (:require [yada.yada :as yada]
            [manifold.deferred :as d]))



(defn hello-handler [ctx]
  (let [result (d/future
                 (Thread/sleep 1000)
                 "hello world")]
    result))

(defn routes [base]
  [base
   [
    ["" (yada/as-resource hello-handler)]
    [true (yada/as-resource nil)]]])
