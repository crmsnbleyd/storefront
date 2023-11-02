;; `routes.lisp' is a part of `queer-web'.
;; It uses `ningle' to set up routes for `clack' to use
;; and mostly renders `djula' templates.

;; Copyright (C) 2023 Arnav Andrew Jose
;; SPDX-License-Identifier: AGPL-3.0-or-later

(in-package :queer-web)

(defvar *app* (make-instance 'ningle:app))

(defun set-simple-route (route template &key title page-name)
  (setf
   (ningle:route *app* route)
   (lambda (props)
     (declare (ignore props))
     (djula:render-template* template nil :title title :page-name page-name))))

;; (set-simple-route "/" +entrypoint+ :title "Hello" :page-name "Home")

(set-simple-route "/artists" +artists+ :title "Arists" :page-name "Artists")

(set-simple-route "/contact" +404+ :title "Contact Us" :page-name "Contact Us")

(set-simple-route "/privacy-policy" +privacy-policy+
		  :title "Privacy Policy" :page-name "Privacy Policy")
