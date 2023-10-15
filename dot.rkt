#lang racket

(define x 7)

; esto es un comment
(define (doble numero) (* numero 2))

; solo para entetros postivos
(define (factorial numero)
  (if (= numero 1)
      1
      (* numero (factorial (- numero 1)))))