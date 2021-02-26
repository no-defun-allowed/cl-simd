(in-package #:sb-x86-64-asm)

(macrolet ((define-sse-inst-implicit-mask (name prefix op1 op2)
             `(define-instruction ,name (segment dst src mask)
                ,@(2byte-sse-inst-printer-list
                    '2byte-xmm-xmm/mem prefix op1 op2
                    :printer '(:name :tab reg ", " reg/mem ", XMM0"))
                (:emitter
                 (aver (xmm-register-p dst))
                 ;; How will MASK be a register and TN?
                 #+(or) (aver (and (xmm-register-p mask) (= (tn-offset mask) 0)))
                 (aver (xmm-register-p mask))
                 (emit-regular-2byte-sse-inst segment dst src ,prefix
                                              ,op1 ,op2)))))

  (define-sse-inst-implicit-mask pblendvb #x66 #x38 #x10)
  (define-sse-inst-implicit-mask blendvps #x66 #x38 #x14)
  (define-sse-inst-implicit-mask blendvpd #x66 #x38 #x15))
