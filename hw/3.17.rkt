#lang racket

(require berkeley)


(define count-pairs
  (let ((seen '()))
    (lambda (x)
      (cond ((not (pair? x)) 0)
            ((memq x seen) 0)
            (else (begin
                    (set! seen (cons x seen))
                    (print seen)
                    (+
                     (count-pairs (car x))
                     (count-pairs (cdr x))
                     1)))))))

(define c3 (cons 3 nil))
(define b3 (cons c3 c3))
(define a3 (cons b3 b3))

(count-pairs a3)
  
