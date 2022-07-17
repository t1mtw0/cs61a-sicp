#lang racket

(require berkeley)


(define (make-account balance secret-password)
  (define (incorrect-password . args) "Incorrect password")
  (define (check-password pass) (eq? pass secret-password))
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount)) balance)
  (define (dispatch password method)
    (if (eq? secret-password password)
      (cond ((eq? method 'withdraw) withdraw)
            ((eq? method 'deposit) deposit)
            (else (error "Unknown request" method)))
      incorrect-password))
  dispatch)

(define (make-joint acc pass new-pass)
  (if ((account pass 'check-password))
      (lambda (pass method)
        (if (eq? new-pass pass)
            (account pass method)
            (error "Incorrect password")))
      (error "Incorrect initial password")))
