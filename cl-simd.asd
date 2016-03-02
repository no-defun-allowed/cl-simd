;;; -*- mode: Lisp; indent-tabs-mode: nil; -*-
;;;
;;; Copyright (C) 2010, Alexander Gavrilov (angavrilov@gmail.com)
;;;
;;; This file defines the cl-simd ASDF system.
;;;
;;; Note that a completely independent definition
;;; is used to build the system as an ECL contrib.

(defsystem :cl-simd
  :version "1.0"
  :author "Alexander Gavrilov"
  :maintainer ""
  :description "SSE intrinsics implementation for ECL & SBCL"
  :mailto "angavrilov@gmail.com"
  :license "CC"
  :components
  #+(and sbcl sb-simd-pack)
  ((:file "sse-package")
   (:file "sbcl-core" :depends-on ("sse-package"))
   (:file "sse-intrinsics" :depends-on ("sbcl-core"))
   (:file "sbcl-functions" :depends-on ("sse-intrinsics"))
   (:file "sbcl-arrays" :depends-on ("sbcl-functions"))
   (:file "sse-array-defs" :depends-on ("sbcl-arrays"))
   (:file "sse-utils" :depends-on ("sse-array-defs")))
  #+(and ecl sse2)
  ((:file "sse-package")
   (:file "ecl-sse-core" :depends-on ("sse-package"))
   (:file "sse-intrinsics" :depends-on ("ecl-sse-core"))
   (:file "sse-array-defs" :depends-on ("sse-intrinsics"))
   (:file "ecl-sse-utils" :depends-on ("sse-intrinsics"))
   (:file "sse-utils" :depends-on ("ecl-sse-utils")))
  #-(or (and sbcl sb-simd-pack)
        (and ecl sse2))
  ()
  :in-order-to ((test-op (test-op cl-simd.test))))

(defsystem :cl-simd.test
  :version "1.0"
  :depends-on (:cl-simd)
  :components
  (#+(or (and sbcl sb-simd-pack)
         (and ecl sse2))
   (:file "test-sfmt")))
