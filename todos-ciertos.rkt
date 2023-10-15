;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname todos-ciertos) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Jean Melendez

;; checkear si hay algun falso en la lista
;; Lista -> Boolean
;; (define (todos-ciertos? lista) #true)

;; given (lista (list true true true))
;; expect #true

;; given (lista (list true false true))
;; expect #false

(define unalista (list true true true))
(define doslista (list true false true))

(check-expect (todos-ciertos? unalista) #true)
(check-expect (todos-ciertos? doslista) #false)

(define (todos-ciertos? lista)
  (cond
    [(empty? lista) #true]
    [else (or (false? (first lista))
              (todos-ciertos? (rest lista)))]))
                