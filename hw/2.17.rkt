#lang racket

(require berkeley)


(define (last-pair lst)
  (if (eq? (cdr lst) '())
      lst
      (last-pair (cdr lst))))

(last-pair (list 23 72 149 34))
