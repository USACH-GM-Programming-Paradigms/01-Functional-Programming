#lang racket

;(define (nombre-fn arg1 arg2)
;  (list arg1 arg2))

;(define nombre2-fn
;  (lambda (arg1 arg2)
;    (list arg1 arg2)))

; Dom: numero (number) -> args
; Rec: numero (number) -> retorno
(define (plus1 n)
  (+ n 1))

; HIGH ORDER FUNCTIONS
; Dom: operacion (fn) X n1 (number) X n2 (number)
; Rec: number
(define (calculadora operacion n1 n2)
  (operacion n1 n2))

;(calculadora suma 1 2)
;; (suma 1 2) 

(define (suma n1 n2)
  (+ n1 n2))

(define (resta n1 n2)
  (- n1 n2))

;; Recursion ->

;; 1. MAP
;; fn X Lista = (fn * e1, fn * e2, fn *e3, fn .. * eN)

;; plus1 x (list 1 2 3) = (plus1 X 1, plus1 X 2, plus1X3)
;;           = (2 3 4)


(define (estudiante id nombre rut promedio)
  (list id nombre rut promedio))

(define (get-id estudiante)
  (car estudiante))

(define (get-nombre estudiante)
  (cadr estudiante))

(define (get-promedio estudiante)
  (cadddr estudiante))


(define (estudiantes . args) args)

(define e1 (estudiante 1 "gonzalo" "18" 7))
(define e2 (estudiante 2 "braulio" "20" 2))
(define e3 (estudiante 3 "elias" "21" 4))
(define misEstudiantes (estudiantes e1 e2 e3))
misEstudiantes

;; (map fn lst)
(map get-id misEstudiantes)
(map get-nombre misEstudiantes)

;; 2. Filter
;; (filter fn lst)
;; Ejemplo: dada una lista-promedio, quiero obtener
;; todos los promedios mayores a 4

(define (es-mayor-a-4? promedio)
  (>= promedio 4))

(filter es-mayor-a-4? (map get-promedio misEstudiantes))

;; OCUPANDO FUNCIONES ANONIMAS
;; Funciones anonimas: funcion sin nombre -> LAMBDA
(filter (lambda (n) (>= n 4))
          (map get-promedio misEstudiantes))


(filter (lambda (estudiante) (>=
                              (get-promedio estudiante) 4))
          misEstudiantes)


;; APPLY / REDUCE
(apply + (list 1 2 3 4))

;;;  FIN HIGH ORDER FUNCTION

;; Currificacion
;; HASKELL CURRY: que las funciones solo pueden operar con
;;        un argumento
;; -> CURRIFICACION

;; (fn arg) -> (fn arg)
;; (fn arg1 arg2) -> ((fn arg1) arg2))
;; (fn arg1 arg2 arg3) -> (((fn arg1) arg2) arg3) 

(define (suma-nocurry n1 n2)
  (+ n1 n2))

(define suma-curry
  (lambda (n1)
    (lambda (n2)
      (+ n1 n2))))

((suma-curry 1) 2)

(define suma-curry3
  (lambda (n1)
    (lambda (n2)
      (lambda (n3)
      (+ n1 n2 n3)))))

(((suma-curry3 1) 2) 3)

;; Filter con currificacion
;; Map con currificacion

;; FIN CURRIFICACIÓN

