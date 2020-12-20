#lang br/quicklang
(require "parser.rkt")

(define (read-syntax path port)
  (define parse-tree (parse path (make-tokenizer port)))
  (define module-datum `(module mapper-mod "expander.rkt"
                          ,parse-tree))
  (datum->syntax #f module-datum))
(provide read-syntax)

(require brag/support)
(define (make-tokenizer port)
  (define (next-token) 
    (define mapper-lexer 
      (lexer [(char-set "+-") lexeme]
             [any-char (next-token)]
             ))
    (mapper-lexer port))
  next-token)
