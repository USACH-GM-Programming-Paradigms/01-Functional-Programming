#lang racket

; +, -, *, /
; (+ param1 param2 paramn)

;; Dom (entradas): number X number
;; Rec (salida): number
(define suma
  (lambda (n1 n2)
    (+ n1 n2)))

(define (suma-v2 n1 n2)
  (+ n1 n2))

(define (resta n1 n2)
  (- n1 n2))

(define s0 (suma 40 50))

(suma 40 50)
(suma-v2 100 200)
s0

;; Descripcion: calculadora recibe una operacion y dos numeros con los cuales opera
(define (calculadora operacion n1 n2)
  (operacion n1 n2))

(define (run filesystem cmd)
  (cmd filesystem))

;; add-drive: va a agregar un disco duro al fs
(define (add-drive fs new-drive)
  (lambda (fs)  ;; siempre en currificacion se utiliza lambda
    (lambda (new-drive)
      (list fs new-drive))))

;((run S0 add-drive) "C:")

;; (run S0 add-drive) arg arg)
;; 

;; (operacion n1 n2)
;; (suma 10 30) ;; arg entrada

;; High Order Functions: las funciones pueden ser argumentos de entrada o pueden ser retornos

;; Currificación: cuando una funcion solo opera con un argumento a la vez
;; Haskell Curry

;(define (calculadora operacion n1 n2)
;  (operacion n1 n2))

(define calculadora-curry
  (lambda (operacion)
    (lambda (n1 n2)
      (operacion n1 n2))))

((calculadora-curry suma) 2 3)

; funcion parcial - paso 1
;(define calculadora-curry
;    (lambda (n1 n2))
;    (suma n1 n2)))


; funcion parcial - paso 1
;(calculadora-curry 2 3)

;; (+ 2 3) => 5


(define calculadora-curry-2
  (lambda (operacion)
    (lambda (n1)
      (lambda (n2)
        (operacion n1 n2)))))

(((calculadora-curry-2 suma) 2) 3)

;; Lab

;; List -> IBM 7004
;; Cartucho addres registry (CAR)
;; Content Decrecent Registry (CDR)

;; Programacion Declarativa

;; Obteniendo el ultimo elemento
(define (get-last-element-lst lst)
  (car (reverse lst)))

;; car: 1er elemento
;; cdr: resto


