#lang racket

(require berkeley)


(define (make-interval a b) (cons a b))

(define (upper-bound int) (cdr int))
(define (lower-bound int) (car int))
(define (center int)
  (/ (+ (lower-bound int) (upper-bound int)) 2))
(define (percent int)
  (* 100 (/ (- (upper-bound int) (center int)) (center int))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))


(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (and (<= (lower-bound y) 0) (>= (upper-bound y) 0))
      (error "Division by 0")
      (mul-interval
       x
       (make-interval (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))))

(define (make-center-percent center per-tol)
  (make-interval (- center (* center (/ per-tol 100)))
                 (+ center (* center (/ per-tol 100)))))

(div-interval (make-interval 3 6)
              (make-interval 4 8))

(sub-interval (make-interval 3 6)
              (make-interval 4 8))

(center (make-interval 2 6))
(percent (make-interval 2 6))
(make-center-percent 4 50)
