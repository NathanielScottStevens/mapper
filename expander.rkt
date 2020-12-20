#lang br/quicklang

(define-macro (mapper-module-begin PARSE-TREE)
              #'(#%module-begin
                 PARSE-TREE))
(provide (rename-out [mapper-module-begin #%module-begin]))

(define-macro (mapper-program ARG ...)
              #'(begin
                  (for/fold ([sum 0])
                    ([mapper-val (list ARG ...)])
                    (+ sum (mapper-val)))))
(provide mapper-program)

(define-macro-cases op
                    [(op "+") #'add]
                    [(op "-") #'subtract])
(provide op)

(define (add) 1) 
(define (subtract) -1) 


