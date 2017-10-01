(ns user
  (:require 
            [mount.core :as mount]
            luminus-app.core))

(defn start []
  (mount/start-without #'luminus-app.core/repl-server))

(defn stop []
  (mount/stop-except #'luminus-app.core/repl-server))

(defn restart []
  (stop)
  (start))


