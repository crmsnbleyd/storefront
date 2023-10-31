(in-package :queer-web)

(clack:clackup
 (lack.builder:builder
  (:static :path "/static/" :root #P"static/")
  *app*))
