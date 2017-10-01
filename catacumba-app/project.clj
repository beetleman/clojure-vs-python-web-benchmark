(defproject catacumba-app "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[funcool/catacumba "2.2.0"]
                 [mount "0.1.11"]
                 [org.clojure/clojure "1.8.0"]]
  :repositories {"sonatype-oss-public" "https://oss.sonatype.org/content/groups/public/"}
  :main ^:skip-aot catacumba-app.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all
                       :uberjar-name "catacumba-app.jar"}})
