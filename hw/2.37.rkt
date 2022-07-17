#lang racket

(require berkeley)


(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map (lambda (e) (car e)) seqs))
            (accumulate-n op init (map (lambda (e) (cdr e)) seqs)))))


(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))

(dot-product '(1 2 3) '(8 10 12))
(matrix-*-vector '((7 9 11) (8 10 12)) '(1 2 3))
(transpose '((2 13) (-9 11) (3 17)))
(matrix-*-matrix '((1 2 3) (4 5 6)) '((7 8) (9 10) (11 12)))
