#lang racket

(require berkeley)


(define (cont-frac n d k)
  (define (cont-frac-1 n d k i)
    (if (= k i)
        0
        (/ (n i) (+ (d i) (cont-frac-1 n d k (+ i 1))))))
  (cont-frac-1 n d k 1))

(define (d-func i)
  (cond ((= (remainder i 3) 2) (+ (* (floor (/ i 3)) 2) 2))
        (else 1.0)))

(define e (+ 2 (cont-frac (lambda (i) 1.0) d-func 10000)))
e
