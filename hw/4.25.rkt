#lang racket

(require berkeley)


(define (unless condition usual-value exceptional-value)
  (if condition exceptional-value usual-value))

(define (factorial n)
  (unless (= n 1)
    (* n (factorial (- n 1)))
    1))

(factorial 5)
; infinite loop
; yes, this definition will work in a normal-order language
