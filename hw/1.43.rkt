#lang racket

(require berkeley)


(define (repeated f n)
  (define (repeated-1 f org n)
    (if (= n 1)
        f
        (repeated-1 (compose f org) org (- n 1))))
  (repeated-1 f f n))

((repeated square 2) 5)
((repeated inc 5) 5)
      
