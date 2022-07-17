#lang racket

(require berkeley)


(define (equal? a b)
  (cond ((and (and (symbol? a) (symbol? b)) (eq? a b) #t))
        ((and (list? a) (list? b))
         (if (or (null? a) (null? b))
             #t
             (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b)))))
        (else #f)))

(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))
