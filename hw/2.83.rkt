#lang racket

(require berkeley)


(define (raise-integer x)
  (/ x 1))

(define (raise-rational x)
  (* x 1.0))

(define (raise-real x)
  (list x 0))

(put 'raise '(integer) raise-integer)
(put 'raise '(rational) raise-rational)
(put 'raise '(real) raise-real)

(define (raise x) (apply-generic 'raise x))
