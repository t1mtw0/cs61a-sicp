#lang racket

(require berkeley)


(define (cont-frac n d k)
  (define (cont-frac-1 n d k i)
    (if (= k i)
        0
        (/ (n i) (+ (d i) (cont-frac-1 n d k (+ i 1))))))
  (cont-frac-1 n d k 1))

(define k 100)
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           k)
