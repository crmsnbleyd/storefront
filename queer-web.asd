(asdf:defsystem #:queer-web
  :depends-on
  (#:alexandria
   #:clack                   ;; hunchentoot requires libcrypto from openssl
   #:clack-errors
   #:ningle
   #:djula
   #:trivia
   #:mito)
  :components
  ((:file "package")
   (:file "templates-compile" :depends-on ("package"))
   (:file "models" :depends-on ("package"))
   (:file "routes" :depends-on ("models" "templates-compile"))
   (:file "main" :depends-on ("routes"))))

(asdf:defsystem #:queer-web/tests
  :depends-on (#:fiveam)
  :components ((:file "tests/main-test")))
