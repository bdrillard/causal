(ns causal.views.public
  (:require [clostache.parser :refer [render-resource]]))

(defn register
  ([]
   (register nil))
  ([errors]
   (let [body (render-resource "templates/register.mustache" errors)]
     (render-resource "templates/base.mustache" {:title "Register"} {:body body}))))

(defn login
  ([]
   (login nil))
  ([errors]
   (let [body (render-resource "templates/login.mustache" errors)]
     (render-resource "templates/base.mustache" {:title "Login"} {:body body}))))

(defn index
  []
  (render-resource "templates/index.mustache" {:title "Causal"}))
