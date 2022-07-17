#| #lang racket

(require berkeley) |#

(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a)
	 (product term (next a) next b))))

(define (product-iter term a next b)
  (define (product-iter-1 p counter max)
    (if (> counter max)
	p
	(product-iter-1 (* p (term counter))
			(next counter)
			max)))
  (product-iter-1 1 a b))

(define (factorial n)
  (product-iter identity 1 inc n))

(define (pidiv4)
  (define (square a)
    (* a a))
  (define (inc2 a)
    (+ a 2))
    
  (/ (* 2 (product-iter square 4 inc2 100000))
     (product-iter square 3 inc2 100001)))

#| -------------- HELPERS ---------------- |#

(define (identity x)
  x)
  
(define (inc a)
  (+ a 1))

(define (cube a)
  (* a a a))

#| -------------- TESTS ----------------- |#

(define (test)
  (equal? (product-iter cube 2 inc 4) 13824)
  (equal? (factorial 6) 720))

(test)
