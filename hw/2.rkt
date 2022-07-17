#lang racket

(require berkeley)


(define (every f lst)
  (if (null? lst)
      '()
      (cons (f (car lst)) (every f (cdr lst)))))

(every square '(1 2 3 4))
(every first '(nowhere man))
