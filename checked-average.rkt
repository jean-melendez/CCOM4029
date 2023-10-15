;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname checked-average) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Jean Melendez

;; Contar cuantos nombres hay en una lista
;; List -> Number
;; (define (how-many unalista) 7)

(define (how-many listar)
  (cond
    [(empty? listar) 0]
    [else
     (+ 1 (how-many (rest listar)))]))


;; Lista -> Numero
;; Sumar los elementos de la lista, luego los divide por la cantidad
;; de elementos en lista
;; (define (checked-average unalista) 14)
;; given (list 1 2 3)
;; expect 2

(define (checked-average lista)  
  (cond
    [(empty? lista) 0]
    [else
     (/ (+ (first lista)
             (checked-average (rest lista))) (how-many lista))]))  

     