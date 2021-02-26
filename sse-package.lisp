;;; -*- mode: Lisp; indent-tabs-mode: nil; -*-
;;;
;;; Copyright (c) 2010, Alexander Gavrilov (angavrilov@gmail.com)
;;;
;;; This file defines a package for all SSE intrinsics.
;;;



(pushnew :SSE2 *features*)

(defpackage #:SSE
  (:use #:COMMON-LISP #:SB-C #:SB-VM #:SB-INT #:SB-KERNEL #:SB-ASSEM #:SB-EXT #:SB-SYS)
  (:import-from #:SB-VM
                #:SINGLE-REG #:DOUBLE-REG
                #:INT-SSE-REG #:SINGLE-SSE-REG #:DOUBLE-SSE-REG #:SSE-REG
                #:INT-SSE-STACK #:SINGLE-SSE-STACK #:DOUBLE-SSE-STACK
                #:INT-SSE-IMMEDIATE #:SINGLE-SSE-IMMEDIATE #:DOUBLE-SSE-IMMEDIATE
                #:SIGNED-REG #:SIGNED-STACK #:UNSIGNED-REG #:UNSIGNED-STACK
                #:SIGNED-NUM #:UNSIGNED-NUM #:UNTAGGED-NUM #:IMMEDIATE
                #:SAP-REG #:DESCRIPTOR-REG #:ANY-REG #:TAGGED-NUM
                #:RAX-OFFSET #:RDI-OFFSET #:RBP-TN #:FRAME-BYTE-OFFSET
                #:MAKE-EA #:REG-IN-SIZE #:LOADW)
  (:import-from #:SB-C
                #:SPLICE-FUN-ARGS #:EXTRACT-FUN-ARGS
                #:%DEFTRANSFORM #:DX-SAFE
                #:GIVE-UP-IR1-TRANSFORM #:ABORT-IR1-TRANSFORM
                #:INSERT-ARRAY-BOUNDS-CHECKS #:VECTOR-LENGTH
                #:ASSERT-LVAR-TYPE #:LVAR-DEST
                #:CONSTANT-LVAR-P #:LVAR-VALUE #:LVAR-TYPE #:LVAR-USES
                #:LVAR-FUN-NAME #:BASIC-COMBINATION-FUN
                #:LEXENV-POLICY #:NODE-LEXENV #:POLICY
                #:CAST-P #:CAST-VALUE #:DELETE-FILTER
                #:FIND-SAETP #:FIND-SAETP-BY-CTYPE)
  (:import-from #:SB-VM
                #:%ARRAY-ROW-MAJOR-INDEX)
  (:shadow #:INT-SSE-PACK #:FLOAT-SSE-PACK #:DOUBLE-SSE-PACK)
  ;; Common exports:
  (:export #:SSE-PACK #:SSE-PACK-P
           #:INT-SSE-PACK #:FLOAT-SSE-PACK #:DOUBLE-SSE-PACK
           #:*SSE-PACK-PRINT-MODE*
           #:SSE-ARRAY #:MAKE-SSE-ARRAY
           #:0.0-PS #:TRUE-SS #:FALSE-SS #:TRUE-PS #:FALSE-PS
           #:SET1-PS #:SET-PS #:SETR-PS #:SETZERO-PS
           #:0.0-PD #:TRUE-SD #:FALSE-SD #:TRUE-PD #:FALSE-PD
           #:SET1-PD #:SET-PD #:SETR-PD #:SETZERO-PD
           #:0-PI #:TRUE-PI #:FALSE-PI #:SETZERO-PI
           #:CPU-MXCSR #:CPU-MXCSR-BITS #:WITH-SAVED-MXCSR #:CPU-CONFIGURE-ROUNDING))
