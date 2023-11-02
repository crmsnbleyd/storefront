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

(set-simple-route "/" +entrypoint+ :title "Hello" :page-name "Home")

(set-simple-route "/artists" +artists+ :title "Arists" :page-name "Artists")

(set-simple-route "/contact" +404+ :title "Contact Us" :page-name "Contact Us")

(set-simple-route "/privacy-policy" +privacy-policy+
		  :title "Privacy Policy" :page-name "Privacy Policy")

(setf
 (ningle:route *app* "/items/:class")
 (lambda (params)
   (declare (ignore params))
   (let ((fake-testing-list (loop :for i :below 10
				  :collect (make-instance 'artist
							  :image-url "https://drew.idktellme.com/images/emacs.jpg"
							  :name (format nil "artist-~A" i)
							  :email (format nil "art~A@art.com" i)))
			    ;; model-name (intern (cdr (assoc :class params))
			    ))
     (djula:render-template* +item-list-test+
			     nil
			     :item-list fake-testing-list
			     :title "Testing"
			     :page-name "Testing"))))
