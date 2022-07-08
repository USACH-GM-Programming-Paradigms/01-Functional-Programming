#lang racket

;; Obtener primer elemento de una lista
;; Dom: lst
;; Rec: elemento
;; Ejemplo: (get-lst-first (list 1 2 3 4))
;; Ejemplo: (get-lst-first (list "hola" "como" "estas" "bien"))
(define get-lst-first
  (lambda (lst)
    (car lst)))


;; Recorrer una lista e imprime cada elemento
;; Dom: lst
;; Rec: void
;; Recursión: Tail Recursion (recursión de cola)
;; Ejemplo: (print-lst (list 1 2 3 4))
;; Ejemplo: (print-lst (list "hola" "como" "estas" "bien"))
(define print-lst
  (lambda (lst)
    (cond [(null? lst) "End"]
          [else 
           (display (car lst))
           (newline)
           (print-lst (cdr lst))])))


;; Constructor de listas
;; Ejemplo: (builder-lst 1 2 3 4)
;; Ejecución: (1 2 3 4)
;; Ejemplo: (builder-lst (list 1 2 3 4) (list 5 6 7 8))
;; Ejecución: ((1 2 3 4) (5 6 7 8))
(define (builder-lst . elements) elements)
