(ns catacumba-app.core
  (:require [mount.core :as mount :refer [defstate]]
            [catacumba.core :as ct]
            [catacumba-app.routes :refer [routes]])
  (:gen-class))


(defn start-server[{:keys [port]}]
  (ct/run-server
   (routes "")
   {:port port}))

(defstate server
  :start (start-server {:port 8080})
  :stop (.stop server))

(defn -main
  "entry point"
  []
  (mount/start)
  ;; All threads are daemon, so block forever:
  @(promise))
