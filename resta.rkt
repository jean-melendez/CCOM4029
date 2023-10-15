#lang plait

(define-type Exp
  [num (n : Number)]
  [plus (left : Exp) (right : Exp)]
  [resta (left : Exp) (right : Exp)])


(define tres (plus (num 1) (num 2)))

(calc : (Exp -> Number))
(define (calc an-exp)
  (type-case Exp an-exp
    [(num n) n]
    [(plus l r) (+ (calc l) (calc r))]
    [(resta l r) (- (calc l) (calc r))]))

(test (calc (num 1)) 1)
(test (calc tres) 3)
(test (calc (num -3)) -3)
(test (calc (plus (num 1) tres)) 4)


;; parser
;; S-Exp -> Exp
(parser : (S-Exp -> Exp))
(define (parser s)
  (cond
    [(s-exp-number? s) (num (s-exp->number s))]
    [(s-exp-list? s)
     (let ([l (s-exp->list s)])
       (cond [(symbol=? '+
                     (s-exp->symbol (first l)))
           (plus (parser (second l)) (parser (third l)))]
             [(symbol=? '- (s-exp->symbol (first l)))
              (resta (parser (second l)) (parser (third l)))]
             [else (error 'parser "list not an addition or substraction")]))]))

(test (parser `1) (num 1))
(test (parser `{+ 1 2}) (plus (num 1) (num 2)))

(test (parser `{+ 20000 {+ 14000 {+ 600500 10}}}) (plus (num 20000)
                                                        (plus (num 14000)
                                                              (plus (num 600500)
                                                                    (num 10)))))


(run : (S-Exp -> Number))

(define (run s)
  (calc (parser s)))

(test (run `1) 1)
(test (run `{+ 1 2}) 3)

(test (run `{- 2 3}) -1)
(test (run `{- 1 {+ 1 0}}) 0)