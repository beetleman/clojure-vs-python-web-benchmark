(ns luminus-app.routes.services
  (:require [ring.util.http-response :refer :all]
            [compojure.api.sweet :refer :all]
            [schema.core :as s]))


(defn hello-handler []
  (Thread/sleep 1000)
  "hello world")

(defapi service-routes
  {:swagger {:ui "/swagger-ui"
             :spec "/swagger.json"
             :data {:info {:version "1.0.0"
                           :title "Sample API"
                           :description "Sample Services"}}}}

    (GET "/" []
         (ok (hello-handler))))
