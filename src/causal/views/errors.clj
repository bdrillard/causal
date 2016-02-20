(ns causal.views.errors
  (:require [clostache.parser :refer [render-resource]]))

(defn page-404
  []
  (let [body (render-resource "templates/404.mustache")]
    (render-resource "templates/base.mustache" {:title "404"} {:body body})))

(defn page-403
  []
  (let [body (render-resource "templates/403.mustache")]
    (render-resource "templates/base.mustache" {:title "403"} {:body body})))
