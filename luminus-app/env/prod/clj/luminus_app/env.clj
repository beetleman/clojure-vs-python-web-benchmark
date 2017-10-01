(ns luminus-app.env
  (:require [clojure.tools.logging :as log]))

(def defaults
  {:init
   (fn []
     (log/info "\n-=[luminus-app started successfully]=-"))
   :stop
   (fn []
     (log/info "\n-=[luminus-app has shut down successfully]=-"))
   :middleware identity})
