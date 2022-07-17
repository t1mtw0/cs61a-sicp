#lang racket

(require berkeley)

(define (squares numbers)
  (if (null? numbers)
      '()
      (cons (* (car numbers)  (car numbers)) (squares (cdr numbers)))))

(define (switch sentence)
  (define (switch-aux sentence)
    (define (switch-1 sentence)
      (cond ((or (eq? (car sentence) 'I)    
                  (eq? (car sentence) 'me)) 'you)
            ((eq? (car sentence) 'you) 'me)
            (else (car sentence)))) 

    (if (null? sentence)
        '()
         (cons (switch-1 sentence) (switch-aux (cdr sentence)))))

  (define (add-i sentence)
    (if (eq? (car sentence) 'me)
      (cons 'I (cdr sentence))
      sentence))

  (add-i (switch-aux sentence)))

(define (ordered? numbers)
  (define (ordered-1? numbers mx)
    (if (eq? numbers '())
      true
      (if (< (car numbers) mx)
        false
        (ordered-1? (cdr numbers) (car numbers)))))

  (ordered-1? numbers (car numbers)))

(define (ends-e sentence)
  (if (eq? sentence '())
    '()
    (if (eq? (last (car sentence)) 'e)
      (cons (car sentence) (ends-e (cdr sentence)))
      (ends-e (cdr sentence)))))

(define (or-special-form-test)
  (define (dummy) (2))
  (or (= 0 0) (dummy)))

#| ------------------------ TESTS --------------------------- |#

(define (test)
  (equal? (squares '(2 3 4 5)) '(4 9 16 25))
  (equal? (switch '(You told me that I should wake you up))
          '(i told you that you should wake me up))
  (equal? (ordered? '(2 3 4 5)) true)
  (equal? (ordered? '(3 2 4 5)) false)
  (equal? (ends-e '(please put the salami above the blue elephant)) '(please the above the blue))
  (equal? (ends-e '(the seeds of future struggle)) '(the future struggle))
  (equal? (or-special-form-test) true)
)

(test)
