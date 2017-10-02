(ns catacumba-app.routes
  (:require [catacumba.core :as ct]
            [catacumba.http :as http]))


(defn hello-handler
  [context]
  (Thread/sleep 1000)
  "hello world")

(defn routes [base]
  (ct/routes [
              [:get "" hello-handler]]))
