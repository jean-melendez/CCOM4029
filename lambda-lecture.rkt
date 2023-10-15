#lang racket

(define zero
  (lambda (f)
         (lambda (x)
                x)))

(define uno
  (lambda (f)
    (lambda (x)
      (f x))))

(define dos
  (lambda (f)
    (lambda (x)
      (f (f x)))))

(define succ
  (lambda (n)
    (lambda (f)
      (lambda (x)
        (f ((n f) x))))))

(define int->num
  (lambda (n)
    (if (zero? n)
        zero
        (succ (int->num (- n 1))))))

(define add
  (lambda (x)
    (lambda (y)
      ((y succ) x))))

