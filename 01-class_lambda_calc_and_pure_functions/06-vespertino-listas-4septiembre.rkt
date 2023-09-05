#lang racket


;;
;; Par = (a . b)
;; Tuplas/Pairs/Cons => Construct

;; Matematicamente =>
;; cons a b = (a . b)
;; cons a b c = NO PUEDE EXISTIR
;; List a = null | Cons a X List
;;; No puedes decir: null X cons 
;; List a b c = (a . (b . (c . null)) -> listas enlazadas

;; (cons 1 (cons 2 (cons 3 null)))
(list 1 2 3)
(cons 1 (cons 2 (cons 3 null)))

;; Producto = tipo X nombre X precio
(list "fruta" "sandia" 10)
(cons "fruta" (cons "sandia" (cons 10 null)))

;; Funcion cons
;; Funcion para agregar elemento a una lista
;; (cons elemento lista) -> se agrega por cabeza

(define (agregar-elemento-principio elemento lista)
  (cons elemento lista))

(agregar-elemento-principio "holi" (list 1 2 3))
(agregar-elemento-principio "descripción de producto" (list "fruta" "manzana" 10))

;; Si invierto el orden
;; (cons (list 1 2 3) "hola") : creo un par:
;; '((1 2 3) . "hola")

;; (cons (list 1 2 3) (list 4 5 6))
;; ( (1 2 3) . (list 4 5 6)
;; ((1 2 3) (cons 4 (cons 5 (cons 6))) = ((1 2 3) 4 5 6)


(list 1)
;'(1)  -> (cons 1 null) : las listas son pares de pares

;; Funcion append: recibo n listas -> return una lista que contiene todos los valores contenidos
(append (list 1 2 3) (list 4 5 6) (list 7 8 9))

;; append yo puedo agregar un elemento al final de una lista
(append (list 1 2 3 4) 5)  ; entrega un par: '(1 2 3 4 . 5)
(append (list 1 2 3 4) (list 5))  ; '(1 2 3 4 5)

(define (agregar-al-final lista valor)
  (append lista (list valor)))

(agregar-al-final (list 7 8 9) 0)

