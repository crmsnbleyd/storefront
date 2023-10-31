;; `main.lisp' is a part of `queer-web'. It starts the server.
;; Copyright (C) 2023 Arnav Andrew Jose

;; SPDX-License-Identifier: AGPL-3.0-or-later

(in-package :queer-web)

(clack:clackup
 (lack.builder:builder
  (:static :path "/static/" :root #P"static/")
  *app*))
