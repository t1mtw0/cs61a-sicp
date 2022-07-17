#lang racket

(require berkeley)


(define x 10)
(parllel-execute (lambda () (set! x (* x x)))
                 (lambda () (set! x (* x x x))))

#|
1: 1000000
2: 100
3: 1000
4: 10000
5: 100000
|#

(define x 10)
(define s (make-serializer))
(parallel-execute (s (lambda () (set! x (* x x))))
                  (s (lamda () (set! x (* x x x)))))

#|
1: 1000000
|#
