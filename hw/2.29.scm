(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))

#| new versions |#
(define (make-branch length structure)
  (cons length structure))
(define (make-mobile left right)
  (cons left right))

(define (left-branch m)
  (car m))
#| add (car ...) to existing code for old version |#
(define (right-branch m)
  (cdr m))
(define (branch-length b)
  (car b))
#| add (car ...) to existing code for old version |#
(define (branch-structure b)
  (cdr b))

#| -------------- HELPERS ------------------ |#

(define (weight-branch branch)
  (if (number? (branch-structure branch))
      (branch-structure branch)
      (total-weight (branch-structure branch))))

#| ----------------------------------- |#

(define (total-weight mobile)
  (+ (weight-branch (left-branch mobile))
     (weight-branch (right-branch mobile))))

(define (is-balanced? mobile)
  (if (= (* (branch-length (right-branch mobile)) (weight-branch (right-branch mobile)))
	 (* (branch-length (left-branch mobile)) (weight-branch (left-branch mobile))))
      (cond ((not (number? (branch-structure (right-branch mobile)))) (is-balanced? (branch-structure (right-branch mobile))))
	    ((not (number? (branch-structure (left-branch mobile)))) (is-balanced? (branch-structure (left-branch mobile))))
	    (else #t))
      #f))

(define m1
  (make-mobile
   (make-branch 1 4)
   (make-branch 1 (make-mobile
                   (make-branch 1 4)
                   (make-branch 1 (make-mobile
                                   (make-branch 1 4)
                                   (make-branch 1 4)))))))

(define m2
  (make-mobile
   (make-branch 1 4)
   (make-branch 1 4)))

(define m3
  (make-mobile
   (make-branch 1 (make-mobile
		   (make-branch 1 4)
		   (make-branch 1 4)))
   (make-branch 1 (make-mobile
		   (make-branch 1 4)
		   (make-branch 1 4)))))

(total-weight m1)
(is-balanced? m2)
(is-balanced? m3)
