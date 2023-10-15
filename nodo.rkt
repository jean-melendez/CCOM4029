;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname nodo) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; arboles

;; un arbol
; - un nulo
; Nodo Number arbol arbol

(define-struct nodo-nulo [])
(define-struct nodo [val izq der])

(define nulo (make-nodo-nulo))
(define tres (make-nodo 3 nulo nulo))
(define cinco (make-nodo 5 nulo nulo))

(define uno (make-nodo 1 tres cinco))

;; contar
;; un arbol -> Number
;;(define (contar-nodo un-arbol) 1)

(check-expect (contar-nodo uno) 3)
(check-expect (contar-nodo tres) 1)

(define (contar-nodo un-arbol)
  (cond
    [(nodo-nulo? un-arbol) 0]
    [(nodo? un-arbol) (+ 1
                         (contar-nodo (nodo-izq un-arbol))
                         (contar-nodo (nodo-der un-arbol)))]))

;; insertar
;; Numbero Arbol -> Arbol
;; (define (insertar val arbol) nulo)

(define (insertar val arbol)
  (make-nodo val nulo arbol))

(check-expect (insertar 6 uno) (make-nodo 6 nulo uno))
(check-expect (insertar 1 nulo) (make-nodo 1 nulo nulo))