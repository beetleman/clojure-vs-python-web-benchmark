(ns yada-app.routes
  (:require [yada.yada :as yada]))



(defn hello-handler [ctx]
  (Thread/sleep 1000)
  "hello world")


(defn routes [base]
  [base
   [
    ["" (yada/as-resource hello-handler)]
    [true (yada/as-resource nil)]]])
