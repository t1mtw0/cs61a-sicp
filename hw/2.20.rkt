#lang racket

(require berkeley)


(define (same-parity x . l)
  (define (filter-l l f)
    (if (empty? l)
        empty
        (if (f (car l))
            (cons (car l) (filter-l (cdr l) f))
            (filter-l (cdr l) f))))
  (cons x (filter-l l (lambda (a) (eq? (even? x) (even? a))))))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
