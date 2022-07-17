#lang racket

(require berkeley)


(define (for-each f lst)
  (if (empty? lst)
      #t
      (begin
        (f (car lst))
        (for-each f (cdr lst)))))

(for-each (lambda (x)
            (newline)
            (display x))
          (list 57 321 88))
