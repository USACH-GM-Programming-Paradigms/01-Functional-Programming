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

;Composición de funciones

(define (compose f g)
  (define (the-composition . args)
    (f (apply g args)))
  the-composition)

(define c1 (make-counter))
(define c2 (make-counter))