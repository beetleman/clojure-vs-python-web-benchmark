(defproject yada-app "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.8.0"]
                 [aleph "0.4.3"]
                 [mount "0.1.11"]
                 [bidi "2.1.2"]
                 [yada "1.2.9"]]
  :main ^:skip-aot yada-app.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
