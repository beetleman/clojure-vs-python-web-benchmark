(ns yada-app.core
  (:require [mount.core :as mount :refer [defstate]]
            [yada.yada :as yada]
            [yada-app.routes :refer [routes]])
  (:gen-class))

(defn start-server[{:keys [port]}]
  (yada/listener
   (routes "/")
   {:port port}))

(defstate server
  :start (start-server {:port 8080})
  :stop ((:close server)))

(defn -main
  "entry point"
  []
  (mount/start)
  ;; All threads are daemon, so block forever:
  @(promise))
