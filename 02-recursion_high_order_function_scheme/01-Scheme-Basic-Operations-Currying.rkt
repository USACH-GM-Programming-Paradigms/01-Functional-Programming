#lang racket

;; Funciones

; Scheme tiene dos formas para definir una función
; 1. (define f (lambda (p1 p2) ...))
; 2. (define (f p1 p2) ...)
; donde f es el nombre de la función y px es el argumento

; Ambas formas son lo mismo

;; Ejemplo: (calculadora-lambda suma 2 3)
(define calculadora-lambda ; nombre-funcion
  (lambda (operacion a b) ; argumentos
    (operacion a b))) ; retorno

;; Ejemplo: (calculadora suma 2 3)
(define (calculadora operacion a b) ;(nombre-funcion arg1 arg2 arg3)
  (operacion a b)) ; retorno


;; Ejemplo: (suma 2 3)
(define (suma a b)
  (+ a b))

;; Ejemplo: (resta 2 3)
(define resta
  (lambda (a b)
    (- a b)))

;; Currrying
;; Currificación

;; Ejemplo: ((curry2) f) arg1) arg2)
(define curry2
  (lambda (f)
    (lambda (arg1)
      (lambda (arg2)
        (f arg1 arg2)))))

;; Ejemplo: (((curry3) f) arg1) arg2) arg3)
(define curry3
  (lambda (f)
    (lambda (arg1)
      (lambda (arg2)
        (lambda (arg3)
          (f arg1 arg2 arg3))))))

;; Ejemplo: (((calculadora-curry suma) 2) 3)
(define calculadora-curry
  (lambda (operacion)
    (lambda (a)
      (lambda (b)
        (operacion a b)))))


; Descripcion: funcion que obtiene el valor absoluto
; Dom: number
; Rec: number
; Ejemplo: (abs 9)
; Ejemplo: (abs -9)
; Ejemplo: (abs 0)
(define (abs x)
  (cond [ (< x 0) (- x) ]
        [ (= x 0) 0 ]
        [ (> x 0) x ]))

;; Constructor de listas
;; Ejemplo: (builder-lst 1 2 3 4)
;; Ejecución: (1 2 3 4)
;; Ejemplo: (builder-lst (list 1 2 3 4) (list 5 6 7 8))
;; Ejecución: ((1 2 3 4) (5 6 7 8))
(define (builder-lst . elements) elements)

;; Ejemplo de contenedor de valor
;; Ejemplo: (contenedor "miContenedor" (list 1 2 3) (list 2 3 4) (list 3 4 5))
;; Ejemplo: (contenedor "miContenedor" 1 2 "lunes" "martes" "miercoles" 3.14)
(define (contenedor nombre-contenedor . elements)
  (list nombre-contenedor elements))

;; Ejemplo: (calculadora-n-args-operacion + 1 2 3 4)
(define (calculadora-n-args operacion . numeros)
  (apply operacion numeros))
