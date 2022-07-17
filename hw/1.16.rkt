#lang racket

(require berkeley)


(define (fast-expt b n)
  (define (fast-expt-1 b n a)
    (cond ((= n 1) a)
          ((even? n) (fast-expt-1 b (/ n 2) (* a (square b))))
          (else (fast-expt-1 b (- n 1) (* a b)))))
  (fast-expt-1 b n 1))

(fast-expt 2 4)
(fast-expt 2 5)
(fast-expt 3 5)
(fast-expt 5 5)
