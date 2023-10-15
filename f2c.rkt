;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname f2c) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (f2c tempf)
  (* 5/9 (- tempf 32)))

(check-expect (f2c 32) 0)
(check-expect (f2c 212) 100)
(check-expect (f2c 77) 25)