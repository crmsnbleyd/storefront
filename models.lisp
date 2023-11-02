;; `models.lisp' is a part of `queer-web'.
;; It uses `mito' to create classes and generate tables
;; for RDBMS' and our application to use.
;; It can also automatically generate migrations.

;; Copyright (C) 2023 Arnav Andrew Jose
;; SPDX-License-Identifier: AGPL-3.0-or-later

;; https://github.com/fukamachi/mito is currently ALPHA software
;; so the maintenance burden falls on us, wherever applicable.

(in-package :queer-web)

(defun database-connect (&optional (driver :sqlite3) (name "queer-web"))
  (unless (eq driver :sqlite3)
    (error "Not implemented yet"))
  (mito:connect-toplevel driver :database-name name))

(defclass person ()
  ((email :col-type (:varchar 128)
	  :accessor object-email)
   (name :col-type (:varchar 64)
	 :accessor object-name))
  (:metaclass mito:dao-table-mixin)
  (:unique-keys email)
  (:documentation "Abstract base class for, etc, `artist'."))

(mito:deftable artist (person)
  ((profile-image-url :col-type (or (:varchar 128) :null)))
  (:unique-keys email)
  (:documentation "Creator of queer-web products."))

(mito:deftable product ()
  ((name :col-type (:varchar 64))
   (artist :col-type artist)    ;; use objects of class artist instead of id to fetch
   (price :col-type :integer :documentation "Price in ₨, never fractional")
   (image-url :col-type (or (:varchar 128) :null))))

(defun get-table-range (table start &key (end -1) (sort-predicate :id))
  "Get from TABLE row START to row END (inclusive)
when ordered by some criteria SORT-PREDICATE.
If END is not passed, get until last row."
  (mito:select-dao table
    (sxql:order-by sort-predicate)
    (sxql:offset start)
    (sxql:limit
     (cond
       ((= -1 end) end)
       ((< end start) 0)
       (t (1+ (- end start)))))))
