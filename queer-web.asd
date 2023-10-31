(asdf:defsystem #:queer-web
  :depends-on (#:alexandria
	       #:clack #:ningle
	       #:djula #:trivia
         #:postmodern)
  :components
  ((:file "package")
   (:file "templates-compile" :depends-on ("package"))
   (:file "routes" :depends-on ("templates-compile"))
   (:file "main" :depends-on ("routes"))))

(asdf:defsystem #:queer-web/tests
  :depends-on (#:fiveam)
  :components ((:file "tests/main-test")))
