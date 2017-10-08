(ns yada-app.routes
  (:require [yada.yada :as yada]
            [schema.core :as s]
            [manifold.deferred :as d]))



(defn hello-response [ctx]
  (let [delay  (get-in ctx [:parameters :query :delay])
        result (d/future
                 (Thread/sleep delay)
                 "hello world!")]
    result))

(def hello-resource
  (yada/resource
   {:methods {:get
              {:parameters {:query {:delay s/Int}}
               :produces   {:media-type "text/plain"}
               :response   hello-response}}}))

(defn routes [base]
  [base
   [
    ["" hello-resource]
    [true (yada/as-resource nil)]]])
