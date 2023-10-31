(in-package :queer-web)

(djula:add-template-directory #P"templates/")

(defparameter +entrypoint+
  (djula:compile-template* "index.html"))

(defparameter +privacy-policy+
  (djula:compile-template* "privacy.html"))

(defparameter +404+
  (djula:compile-template* "404.html"))
