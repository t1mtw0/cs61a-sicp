#lang racket

(require berkeley)

#|
(define (square-tree tree)
  (cond ((not (list? tree)) (square tree))
        ((null? tree) '())
(else (cons (square-tree (car tree)) (square-tree (cdr tree))))))
|#

(define (square-tree tree)
  (if (not (list? tree))
      (square tree)
      (map square-tree tree)))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
