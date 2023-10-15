#lang racket

;; explota, porque evalua sus argumentos
;(define (strict-if C T E)
;  (if (boolean? C)
;      (if C T E)
;      (error 'strict-if "quiero un Boolenano")))

;; esto explota
;;(strict-if #t 2 (/ 1 0))

(define-syntax strict-if
  (syntax-rules ()
    [(strict-if C T E)
     (if (boolean? C)
         (if C T E)
         (error 'strict-if "quiero un Booleano"))]))

(strict-if #t 2 (/ 1 0))

(define-syntax let1
  (syntax-rules ()
    [(let1 (var val) body)
     ((lambda (var) body) val)]))

(let1 (x 1) (+ x x))

(define-syntax my-let2
  (syntax-rules ()
    [(my-let2 ([var val] ...) body)
     ((lambda (var ...) body) val ...)]))

(my-let2 ([x 3] [y 4]) (- y x))