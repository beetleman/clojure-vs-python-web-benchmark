(ns yada-app.routes
  (:require [yada.yada :as yada]))


(defn routes [base]
  [base
   [
    ["" (yada/as-resource {:msg "hello world"})]
    [true (yada/as-resource nil)]]])
