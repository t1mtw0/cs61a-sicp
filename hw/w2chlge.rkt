#lang racket

(require berkeley)


(((lambda (fact)
   (lambda (x) (fact fact x)))
 (lambda (f n)
   (if (= n 0)
       1
       (* n (f f (- n 1)))))) 5)
