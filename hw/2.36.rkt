#lang racket

(require berkeley)


(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map (lambda (e) (car e)) seqs))
            (accumulate-n op init (map (lambda (e) (cdr e)) seqs)))))

(accumulate-n + 0 '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))
