#lang racket

(require berkeley)


(define (tree-map fn tree)
  (if (not (list? tree))
      (fn tree)
      (map (lambda (x) (tree-map fn x)) tree)))
  
(define (square-tree tree) (tree-map square tree))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
