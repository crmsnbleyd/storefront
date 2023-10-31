(in-package :queer-web)

(defvar *app* (make-instance 'ningle:app))

(setf
 (ningle:route *app* "/")
 (lambda (props)
   (declare (ignore props))
   (djula:render-template* +entrypoint+ nil :title "Hello" :page-name "Home")))

(setf
 (ningle:route *app* "/privacy-policy")
 (lambda (props)
   (declare (ignore props))
   (djula:render-template* +privacy-policy+ nil :title "Privacy Policy" :page-name "Privacy Policy")))
