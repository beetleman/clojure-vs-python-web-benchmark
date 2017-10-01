(ns luminus-app.env
  (:require [selmer.parser :as parser]
            [clojure.tools.logging :as log]
            [luminus-app.dev-middleware :refer [wrap-dev]]))

(def defaults
  {:init
   (fn []
     (parser/cache-off!)
     (log/info "\n-=[luminus-app started successfully using the development profile]=-"))
   :stop
   (fn []
     (log/info "\n-=[luminus-app has shut down successfully]=-"))
   :middleware wrap-dev})
