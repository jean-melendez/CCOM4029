;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname prueba-lista) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; (cons __ '())

(define unalista (cons "Marcos" (cons "Lilliana" (cons "Jean" '()))))

;; sumar si jean esta en la lista
;; Lista -> Boolean
;; (define (si-jean lista) #true)

;; given (cons "Jean" unalista)

;; expect #true

(check-expect (si-jean? (cons "Jean" unalista)) #true)

;; given (cons "Marcos" (cons "Lilliana" '()))
;; expect #false

(check-expect (si-jean? (cons "Marcos" (cons "Lilliana" '()))) #false)

;; (define (si-jean lista)
;;    (... lista ...))

(define (si-jean? lista)
  (cond
    [(empty? lista) #false]
       [else (or (string=? "Jean" (first lista))
                 ;; sigo buscando
                 (si-jean? (rest lista)))]))

;; Contar cuantos nombres hay en una lista
;; List -> Number
;; (define (how-many unalista) 7)

(check-expect (how-many '()) 0)
(check-expect (how-many unalista) 3)

(define (how-many alon)
  (cond
    [(empty? alon) 0]
    [else
     (+ 1 (how-many (rest alon)))]))

;; Lista -> Numero
;; Sumar los elementos de la lista
;; (define (sum-list unalista) 14)

(check-expect (sum-list (cons 1 '())) 1)
(check-expect (sum-list '()) 0)
(check-expect (sum-list (cons 1 (cons 2 (cons 3 '())))) 6)

(define (sum-list alon)
  (cond
    [(empty? alon) 0]
    [else (+ (first alon)
             (sum-list (rest alon)))]))