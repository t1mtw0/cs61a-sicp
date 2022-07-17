#lang racket

(require berkeley)


(define (next-perf n)
  (define (sum-of-factors n i s)
    (if (= i (+ (floor (/ n 2)) 1))
        s
        (if (= (remainder n i) 0)
            (sum-of-factors n (+ i 1) (+ s i))
            (sum-of-factors n (+ i 1) s))))
  (if (= (sum-of-factors n 1 0) n)
      n
      (next-perf (+ n 1)))) 

(next-perf 2)
(next-perf 7)
(next-perf 30)
