#lang racket

(require berkeley)


(define (filtered-accumulate combiner null-value filtr term a next b)
  (if (> a b)
      null-value
      (if (filtr a)
	  (combiner (term a)
		    (filtered-accumulate combiner null-value filtr term (next a) next b))
	  (combiner null-value
		    (filtered-accumulate combiner null-value filtr term (next a) next b)))))

(define (sum-square-prime a b)
  (filtered-accumulate + 0 prime? square a inc b))

(define (product-pos-gcd n)
  (define (is-relative-prime? i)
    (= (gcd i n) 1))
  
  (filtered-accumulate * 1 is-relative-prime? identity 1 inc n))

#| --------------------------- HELPERS ------------------------------- |#

(define (square x)
  (* x x))

(define (inc x)
  (+ x 1))

#| --------------------------- TESTS -------------------------------- |#

(define (tests)
  (equal? (sum-square-prime 1 4) 14)
  (equal? (product-pos-gcd 4) 3))

(tests)
