(ns catacumba-app.routes
  (:require [catacumba.core :as ct]
            [catacumba.http :as http]))


(defn hello-handler
  [context]
  (http/ok "{\"msg\": \"hello world\"}" {:content-type "application/json"}))

(defn routes [base]
  (ct/routes [
               [:get "" hello-handler]]))
