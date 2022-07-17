#lang racket

; Constructores
(cons 0 1)
(list 2 3 4 5 6)

; Funciones de pertenencia
(list? (list 2 3 4 5 6))
(null? (list 2 3 4 5 6))
(null? (list))

; Selectores
(car (list 2 3 4 5 6))
(cdr (list 2 3 4 5 6))
(car (cdr (list 2 3 4 5 6)))
(caddr (list 2 3 4 5 6))

; Funciones auxiliares
(length (list 2 3 4 5 6))

; Filter
(define myFilter
  (lambda (f L) 
    (if (null? L)
        null
        (if (f (car L))
            (cons (car L) (myFilter f (cdr L)))
            (myFilter f (cdr L))
            )
        )
    ))

(define mayorQue3 (lambda (n) (> n 3)))

(myFilter even? (list 2 3 4 5 6))
(myFilter mayorQue3 (list 2 3 4 5 6))

; Map
(define myMap
  (lambda (f L)
    (if (null? L)
        null
        (cons (f (car L)) (myMap f (cdr L)))
        )
    ))

(define cuadrado (lambda (n) (* n n)))

(myMap cuadrado (list 2 3 4 5 6))

; Reduce/Apply
(define myReduce
  (lambda (f L)
    (if (null? L)
        null
        (if (null? (cdr L))
            (car L)
            (f (car L) (myReduce f (cdr L)))
            )
        )
    ))

(myReduce + (list 2 3 4 5 6))

; Funciones declarativas como parte del lenguaje
(filter
 (lambda (x) (and (positive? x) (even? x)))
 (list 3 -5 22 0 -1 13 -44 88))

(map (lambda (x) (* 2 x)) (list 10 20 30 40 50))

(apply + (list 2 3 4))