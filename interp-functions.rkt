#lang plait

(define-type Value
  [numV (n : Number)]
  [boolV (b : Boolean)]
  [funV (x : Symbol) (body : Exp) (env : Env)])

(define-type Exp
  [numE (n : Number)]
  [plusE (left : Exp) (right : Exp)]
  [varE (name : Symbol)]
  [let1E (var : Symbol)
         (value : Exp)
         (body : Exp)]
  [funE (arg : Symbol)
        (body : Exp)]
  [appE (f : Exp)
        (val : Exp)])

(define uno-mas-uno (appE (funE 'x (plusE (varE 'x) (varE 'x))) (numE 1)))

`{let {x 1} {+ x x}}

(define dos (let1E 'x
                   (numE 1)
                   (plusE (varE 'x) (varE 'x))))

(define-type-alias Env (Hashof Symbol Value))
(define mt-env (hash empty)) ;; "empty environment"

(define (lookup (x : Symbol) (an-env : Env))
  (type-case (Optionof Value) (hash-ref an-env x)
    [(none) (error x "not bound")]
     [(some n) n]))

(define (extend old-env new-name value)
  (hash-set old-env new-name value))

(interp : (Exp Env -> Value))
(define (interp an-exp an-env)
  (type-case Exp an-exp
    [(numE n) (numV n)]
    [(varE x) (lookup x an-env)]
    [(plusE l r) (add (interp l an-env) (interp r an-env))]
    [(let1E x val body)
     (let ([new-env (extend
                     an-env
                     x
                     (interp val an-env))])
           (interp body new-env))]
    [(funE x body) (funV x body an-env)]
    [(appE f v)
     (let ([fun-value (interp f an-env)]
           [arg-value (interp v an-env)])
       (type-case Value fun-value
         [(funV arg body env-viejo) (interp body (extend env-viejo arg arg-value))]
         [else (error 'app "no me diste una funcion")]))]))

(add : (Value Value -> Value))
(define (add v1 v2)
  (type-case Value v1
    [(numV n1)
     (type-case Value v2
       [(numV n2)
        (numV (+ n1 n2))]
       [else (error '+ "quiere lado derecho numero")])]
     [else (error '+ "quiere lado izquierdo numero")]))

(test (interp dos mt-env) (numV 2))

(define tres (let1E 'x (numE 1)
                 (plusE (let1E 'x (numE 2) (varE 'x))
                        (varE 'x))))

;; Static scope es 3
(test (interp tres mt-env) (numV 3))

;; Probando funciones
(test (interp uno-mas-uno mt-env) (numV 2))

;;; prueba rara
(test (interp (let1E 'x (numE 1)
                     (let1E 'f (funE 'y (varE 'x))
                            (let1E 'x (numE 2)
                                   (appE (varE 'f) (numE 10))))) mt-env) (numV 1))
                            