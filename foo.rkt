#lang racket

; Number -> String
; devuelve "si" si es 7 o "no"
; dado: 6, espero: "no"
; dado: 7.0, espero: "si"
; header
; functional example
; template
(define (foo x)
  (if (= x 7) "si" "no"))