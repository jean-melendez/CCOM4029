#lang plait

(define-type Exp
  [numE (n : Number)]
  [boolE (b : Boolean)]
  [plusE (left : Exp) (right : Exp)]
  [cndE (test : Exp) (then : Exp) (else : Exp)])

(define-type Value
  [numV (n : Number)]
  [boolV (b : Boolean)])

(define tres (plusE (numE 1) (numE 2)))

(calc : (Exp -> Value))
(define (calc an-exp)
  (type-case Exp an-exp
    [(numE n)  (numV n)]
    [(boolE b) (boolV b)]
    [(plusE l r) (add (calc l) (calc r))]
    [(cndE c t e)
     (if (boolean-decision (calc c))
         (calc t)
         (calc e))]))

(define (boolean-decision v1)
  (type-case Value v1
    [(boolV b) b]
    [else (error 'if "quiere un Booleano")]))
         
(add : (Value Value -> Value))
(define (add v1 v2)
  (type-case Value v1
    [(numV n1)
     (type-case Value v2
       [(numV n2)
        (numV (+ n1 n2))]
       [else (error '+ "quiere lado derecho numero")])]
     [else (error '+ "quiere lado izquierdo numero")]))
       

(test (calc (numE 1)) (numV 1))
(test (calc tres) (numV 3))
(test (calc (numE -3)) (numV -3))
(test (calc (plusE (numE 1) tres)) (numV 4))

(test (calc (cndE (boolE #t) (numE 2) (numE 0))) (numV 2))


;; parser
;; S-Exp -> Exp
(parser : (S-Exp -> Exp))
(define (parser s)
  (cond
    [(s-exp-number? s) (numE (s-exp->number s))]
    [(s-exp-symbol? s)
     (cond
       [(symbol=? 'true (s-exp->symbol s)) (boolE #t)]
       [(symbol=? 'false (s-exp->symbol s)) (boolE #f)])]
    [(s-exp-list? s)
     (let ([l (s-exp->list s)])
       (cond [(symbol=?  '+ (s-exp->symbol (first l)))
                      (plusE (parser(second l)) (parser(third l)))]
             [(symbol=? 'if (s-exp->symbol (first l)))
              (cndE (parser (second l))
                   (parser (third l))
                   (parser (fourth l)))]
             [else
              (error 'parse "list not an addition")]))]))

(test (parser `1) (numE 1))
(test (parser `{+ 1 2}) (plusE (numE 1) (numE 2)))
(test (parser `{+ 20000 {+ 14000 {+ 600500 10}}}) (plusE (numE 20000)
                                                        (plusE (numE 14000)
                                                              (plusE (numE 600500)
                                                                    (numE 10)))))

(run : (S-Exp -> Value))

(define (run s)
 (calc (parser s)))

(test (run `1) (numV 1))
(test (run `{+ 1 2}) (numV 3))

(test (run `{if true 2 3}) (numV 2))       
