(define (accumulate-rec combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
		(accumulate-rec combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (accumulate-iter-1 p counter max)
    (if (> counter max)
	p
	(accumulate-iter-1 (combiner p (term counter))
			   (next counter)
			   max)))
  (accumulate-iter-1 null-value a b))

(define (product term a next b)
  (accumulate-rec * 1 term a next b))

(define (sum term a next b)
  (accumulate-iter + 0 term a next b))

#| -------------------- HELPERS --------------------- |#

(define (identity x)
  x)

(define (inc a)
  (+ a 1))

#| --------------------- TESTS ---------------------- |#

(define (tests)
  (equal? (product identity 1 inc 4) 24)
  (equal? (sum identity 2 inc 10) 54))

(tests)

