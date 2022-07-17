#lang racket

(require berkeley)


(define (substitute x old-word new-word)
  (cond ((null? x) '())
        ((not (list? x)) (if (eq? x old-word)
                             new-word
                             x))
        (else (cons (substitute (car x) old-word new-word)
                    (substitute (cdr x) old-word new-word)))))

(define (substitute2 x old-lst new-lst)
  (define (ret-new-word x old-lst new-lst)
    (cond ((empty? old-lst) x)
          ((eq? x (car old-lst)) (car new-lst))
          (else (ret-new-word x (cdr old-lst) (cdr new-lst)))))
  
  (cond ((null? x) '())
        ((not (list? x)) (ret-new-word x old-lst new-lst))
        (else (cons (substitute2 (car x) old-lst new-lst)
                    (substitute2 (cdr x) old-lst new-lst)))))

(substitute '((lead guitar) (bass guitar) (rhythm guitar) drums)
            'guitar 'axe)
(substitute2 '((4 calling birds) (3 french hens) (2 turtle doves))
             '(1 2 3 4) '(one two three four))
