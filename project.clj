(defproject causal "0.1.0-SNAPSHOT"
  :description "A platform for connecting non-profits to developers"
  :url "http://github.com/bdrillard/causal"
  :dependencies [[org.clojure/clojure "1.6.0"]
                 [compojure "1.1.6"]
                 [hiccup "1.0.5"]
                 [de.ubercode.clostache/clostache "1.4.0"]
                 [ring-server "0.3.1"]
                 [ring/ring-json "0.4.0"]
                 [buddy "0.10.0"]
                 [mysql/mysql-connector-java "5.1.6"]
                 [yesql "0.5.2"]
                 [danlentz/clj-uuid "0.1.6"]
                 
                 [org.clojure/clojurescript "1.7.228"]
                 [reagent "0.6.0-alpha"]
                 [secretary "1.2.3"]
                 [cljs-ajax "0.5.3"]]
  :plugins [[lein-ring "0.8.12"]
            [lein-environ "1.0.2"]]
  :source-paths ["src/clj"]
  :ring {:handler causal.handler/app
         :init causal.handler/init
         :destroy causal.handler/destroy}
  :profiles
  {:uberjar {:aot :all}
   :production
   {:ring
    {:open-browser? false, :stacktraces? false, :auto-reload? false}}
   :dev
   {:dependencies [[ring-mock "0.1.5"] [ring/ring-devel "1.3.1"]]}}
  :cljsbuild {:builds [{:id "dev"
                        :source-paths ["src/cljs"]
                        :fighwheel {:on-jsload "causal.core"}
                        :compiler {:output-to "resources/public/js/app.js"
                                   :output-dir "resources/public/js/out"
                                   :optimizations :none}}]})
