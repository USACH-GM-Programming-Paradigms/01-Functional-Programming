#lang scheme

;; Currificación

;; Sabemos que una funcion recibe n parametros

(define (calculadora operacion n1 n2)
  (operacion n1 n2))

(define (suma n1 n2)
  (+ n1 n2))

(define calculadora-curry2
  (lambda (operacion)
    (lambda (n1 n2)
      (operacion n1 n2))))

(define calculadora-curry3
  (lambda (operacion)
    (lambda (n1)
      (lambda (n2)
        (operacion n1 n2)))))

;; Ejecución

(calculadora suma 1 2)

((calculadora-curry2 suma) 1 2)

(((calculadora-curry3 suma) 1) 2)


;; Recursión

; Recursión Natural
;; Las operaciones se van acumulando hasta llegar a la condición de borde

(define (sumatoria-lista lst)
  (if (null? lst)
      0
      (+ (car lst) (sumatoria-lista (cdr lst)))))

; Ejecución
(sumatoria-lista (list 1 2 3))

; Recursión Tipo Cola (Tail Recursion)

;; El resultado se va acumulando en un simbolo de argumento de entrada de la función
;; A medida que se recorre la lista (cdr lst) se realiza la operación y se acumula en ecc

(define (sumatoria-lista-tail lst)
  (define (sumatoria-tail-interna lst acc)
    (if (null? lst)
        acc
        (sumatoria-tail-interna (cdr lst) (+ acc (car lst)))))

  (sumatoria-tail-interna 0 lst))

; Ejecución
(sumatoria-lista (list 1 2 3))