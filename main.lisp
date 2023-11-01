;; `main.lisp' is a part of `queer-web'. It provides functions to start and stop the server.

;; Copyright (C) 2023 Arnav Andrew Jose
;; SPDX-License-Identifier: AGPL-3.0-or-later

(in-package :queer-web)

(defparameter *handler* nil)

(defun start ()
  "Starts the server process using clack,
and binds it to *handler*."
  (setf *handler*
	(clack:clackup
	 (lack.builder:builder
	  (:static :path "/static/" :root #P"static/")
	  ;; (:clack-errors
	  ;;  :prod-render
	  ;;  (lambda (condition)
	  ;;    (declare (ignore condition))
	  ;;    (djula:render-template* +404+ nil
	  ;; 			     :title "Page not found"
	  ;; 			     :page-name "Error")))
	  *app*))))

(defun stop ()
  "Stops *handler*."
  (clack:stop *handler*))
