#lang plait

(define-type Exp
  [numE (n : Number)]
  [plusE (left : Exp) (right : Exp)]
  [varE (name : Symbol)]
  [let1E (var : Symbol)
         (value : Exp)
         (body : Exp)])

`{let {x 1} {+ x x}}

(define dos (let1E 'x
                   (numE 1)
                   (plusE (varE 'x) (varE 'x))))

(define-type-alias Env (Hashof Symbol Number))
(define mt-env (hash empty)) ;; "empty environment"

(define (lookup (x : Symbol) (an-env : Env))
  (type-case (Optionof Number) (hash-ref an-env x)
    [(none) (error x "not bound")]
     [(some n) n]))

(define (extend old-env new-name value)
  (hash-set old-env new-name value))

(interp : (Exp Env -> Number))
(define (interp an-exp an-env)
  (type-case Exp an-exp
    [(numE n) n]
    [(varE x) (lookup x an-env)]
    [(plusE l r) (+ (interp l an-env) (interp r an-env))]
    [(let1E x val body)
     (let ([new-env (extend
                     an-env
                     x
                     (interp val an-env))])
           (interp body new-env))]))

(test (interp dos mt-env) 2)

(define tres (let1E 'x (numE 1)
                 (plusE (let1E 'x (numE 2) (varE 'x))
                        (varE 'x))))

;; Static scope es 3
(test (interp tres mt-env) 3)