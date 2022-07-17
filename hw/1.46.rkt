#lang racket

(require berkeley)


(define (iterative-improve good-enough? improve)
  (define (iterative-improve-1 guess)
    (let ((next (improve guess)))
      (if (good-enough? next)
          next
          (iterative-improve-1 next))))
  (lambda (guess) (iterative-improve-1 guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) x))

(define (fixed-point f first-guess)
  (define (good-enough? guess)
    (< (abs (- guess (f guess))) 0.00001))
  ((iterative-improve good-enough? f) first-guess))

(sqrt 16.0)
(fixed-point cos 1.0)
