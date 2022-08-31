#lang racket

; ( 1 1 2 3 4)
; ( (1 2)
;   (2 1)
;   (3 1)
;   (4 1) )
; (list (cons simbolo1 ocurrencia1)
;       (cons simbolo2 ocurrencia2)
;       (cons simbolo2 ocurrencia2)

; (append (cons simbolo1 ocurrencia1) lst) ; asi formo la nueva lista
; (append (cons simbolo count(simbolo) lst) ; asi formo la nueva lista

; (append (cons simbolo count(simbolo) lst) ; asi formo la nueva lista
; recursion tail
;(lst histograma lst-out
; (create-lst pairs (cdr lst) ())
; (create-lst pairs (cdr lst) ((e1 o1))
; (create-lst pairs (cdr lst) ((e1 o1) (e1 o1))(define (list-append old-list new-el)

;(list-append '(b c) 'a)

(define (list-append old-list new-el)
  (cond [(null? old-list) (list new-el)]
        [else (cons (car old-list) 
                    (list-append (cdr old-list) new-el))]))

;(list-append '(b c) 'a)

(list-append (list 1 2 3) 8)
(list-append (list 1 2 3) (cons 4 5))
(list-append (list (cons 1 2) (cons 2 3)) (cons 4 5))

(define (move-lst-into-new-lst lst-in lst-out)
  (cond [(null? lst-in) lst-out]
        [else (move-lst-into-new-lst (cdr lst-in)
                    (list-append lst-out (car lst-in)))]))

(move-lst-into-new-lst (list 1 2 3 4) (list))