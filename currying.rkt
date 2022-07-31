#lang racket

(define (curry2 f)
  (lambda(x)
    (lambda(y)
      (f x y))))

(define (curry3 f)
  (lambda(x)
    (lambda(y)
      (lambda(z)
        (f x y z)))))

(define (uncurry2 f)
  (lambda (x y)
    ((f x) y)))

(define (uncurry3 f)
  (lambda (x y z)
    (((f x) y) z)))


; ((mult 2) 3)
;6
(define mult
  (lambda (a)
    (lambda (b)
      (* a b))))

;(increase-all '(4 2 9 6) 2)
; '(6 4 11 8)
(define (increase-all lst delta)
  (map (lambda (x) (+ x delta)) lst))

;; es mayor a?
;; no currificado
;> (greater? 10 30)
;#t
(define (greater? n x) (> x n))

; ((greater-curry? 10) 5)
; #f
(define (greater-curry? n)
  (lambda (x) (> x n)))

; ((merge list 5 4) 3 2)
; '(5 4 3 2)
; ((merge list 1 2 3) 4 5 6)
;'(1 2 3 4 5 6)
(define merge
  (lambda (f . c)
    (lambda x (apply f (append c x)))))