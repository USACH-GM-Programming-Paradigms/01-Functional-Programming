#lang racket

(define move
  (lambda (lst)
    (car (cdr lst))))


(define get-element
  (lambda (lst)
    (car (cdr lst))))

(define (make-counter)
  (let ((count 0))
    (lambda ()
      (set! count (+ count 1))
      count)))

;Apply-generi c uses the dotted-tail notation described in exercise 2.20, because differ
;ent generic operations may take different numbers of arguments. In apply-generic, op
;has as its value the first argument to apply-generic and args has as its value a list of
;the remaining arguments.

(define (compose f g)
  (define (the-composition . args)
    (f (apply g args)))
  the-composition)

(define c1 (make-counter))
(define c2 (make-counter))