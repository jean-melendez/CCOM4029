#lang racket

;; calcular la distancia entre dos puntos representados por posn

(require test-engine/racket-tests)

(define-struct posn (x y))

(check-expect (posn-x (posn 1 2)) 1)

;; paso 2 
;; posn posn -> Number
;; Devulve un Numero que representa la distancia entre dos puntos
;; dados por posn
;; (define (coord-distance posa posb) 10)

;; paso 3
;; given: (posn 5 5) (posn 10 10)
;; expect: (sqrt 50)
;; given: (posn 0 0) (posn 1 0)
;; expect: 1

;; paso 4
;; (define (coord-dist posa posb)
;; (... posa posb ...))

;;paso 5 programar

(define (coord-dist posa posb)
  (sqrt (+ (sqr (- (posn-x posa) (posn-x posb)))
           (sqr (- (posn-y posa) (posn-y posb))))))

;; paso 6 - pruebas

(check-expect (coord-dist (posn 0 0) (posn 0 1)) 1)
(check-expect (coord-dist (posn 5 5) (posn 10 10)) (sqrt 50) 0.001)

(test)