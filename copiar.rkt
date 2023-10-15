;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname copiar) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; (zero? 0)
;; (add1 10)
;; (sub1 11)

;; copiar - produce una lista de n copias de su segundo argumento
;; Number -> String -> List
;; (define (copiar 10 "hello") '())

;; Given: 2 "hello"
;; Expect: (cons "hello" (cons "hello" '()))

(check-expect (copiar 2 "hello") (cons "hello" (cons "hello" '())))

;; Given: 0 "hello"
;; Expect: '()

(check-expect (copiar 0 "hello") '())

;;(define (copiar n palabra)
;;  (... ( ... n ...)
;;       (... palabra ...) ...))

(define (copiar n palabra)
  (cond [(zero? n) '()]
       [else (cons palabra (copiar (sub1 n) palabra))]))