#lang racket

; Algebraic Data Type
;; Representación de un Estudiante:
;;--------------------------------
;; Type Estudiante = List Nombre X Rut X Seccion X Notas 
;; Type Nombre = String
;; Type Rut = String
;; Type Seccion = String
;; Type Notas = List Number

; TDA Estudiante
;;---------------
;; Constructor:  (make-estudiante nombre rut seccion notas)
;; Selector:     (get-nombre estudiante) (get-rut estudiante) (get-seccion estudiante)
;;               (get-notas estudiante)
;; Modificador:  (set-seccion estudiante nueva-seccion) (add-nota estudiante nueva-nota)

;; Otros: 

; Implementación TDA Estudiante
;;-----------------------------

; TDA Estudiante: Constructor

;; Descripción: constructor del tipo estudiante
;; Tipo de algoritmo/estrategia: NA
;; Tipo de recursión: NA
;; Dom: string X string X string X Notas X number
;; Rec: estudiante
(define (make-estudiante nombre rut seccion notas puntaje)
  (list nombre rut seccion notas puntaje))


; Implementación TDA Notas
;;------------------------
;; Notas es una lista de aridad N. Es decir, una lista dinámica
;; make-notas es lo mismo que decir: list o crea una los siguientes argumentos.
;; Ejemplo:
;; > (make-notas 1 2 3 4)
;; '(1 2 3 4)
(define (make-notas . notas) notas)

(define (get-first-nota notas) (car notas))
(define (get-last-nota notas) (car (reverse notas)))
  
; TDA Estudiante: Selector

;; Descripción: selector de nombre del estudiante
;; Tipo de algoritmo/estrategia: NA
;; Tipo de recursión: NA
;; Dom: estudiante
;; Rec: string
(define (get-nombre estudiante) (car estudiante))

;; Descripción: selector de rut del estudiante
;; Tipo de algoritmo/estrategia: NA
;; Tipo de recursión: NA
;; Dom: estudiante
;; Rec: string
(define (get-rut estudiante) (cadr estudiante))

;; Descripción: selector de seccion del estudiante
;; Tipo de algoritmo/estrategia: NA
;; Tipo de recursión: NA
;; Dom: estudiante
;; Rec: string
(define (get-seccion estudiante) (caddr estudiante))

;; Descripción: selector de notas del estudiante
;; Tipo de algoritmo/estrategia: NA
;; Tipo de recursión: NA
;; Dom: estudiante
;; Rec: notas
(define (get-notas estudiante) (cadddr estudiante))

;; Descripción: selector de puntaje del estudiante
;; Tipo de algoritmo/estrategia: NA
;; Tipo de recursión: NA
;; Dom: estudiante
;; Rec: number
(define (get-puntaje estudiante) (car(cdr(cadddr estudiante))))

; TDA Estudiante: Modificador

;; Descripción: modificador de sección del estudiante
;; Tipo de algoritmo/estrategia: NA
;; Tipo de recursión: NA
;; Dom: estudiante X string
;; Rec: estudiante
(define (set-seccion estudiante new-seccion)
  (make-estudiante (get-nombre estudiante)
                   (get-rut estudiante)
                   new-seccion
                   (get-notas estudiante)
                   (get-puntaje estudiante)))

;; Descripción: modificador de puntaje del estudiante
;; Tipo de algoritmo/estrategia: NA
;; Tipo de recursión: NA
;; Dom: estudiante X number
;; Rec: estudiante
(define (set-puntaje estudiante new-puntaje)
  (make-estudiante (get-nombre estudiante)
                   (get-rut estudiante)
                   (get-seccion estudiante)
                   (get-notas estudiante)
                   new-puntaje))


;(define (add-nota estudiante nueva-nota)
;  (define (add-nota-in-notas notas new-nota new-lst)
;    (cond [(null? (car notas)) new-lst]
;  (estudiante (get-nombre estudiante)
;              (get-rut estudiante)
;              (get-seccion estudiante)
;              nueva-nota))

; Filtrar notas de acuerdo a un criterio
(define (filter-notas pred? estudiante)
  (filter pred? (get-notas estudiante)))

; Subir 1 décima a cada nota

; (subir-1-decima-todas-notas (make-estudiante "nombre" "rut" "seccion" (list 2 3 4)))
(define (subir-1-decima-todas-notas estudiante)
  (make-estudiante (get-nombre estudiante)
                   (get-rut estudiante)
                   (get-seccion estudiante)
                   (map (lambda (x) (+ x 0.1)) (get-notas estudiante))))

(define (len lst)
  (cond ((null? lst)
         0)
        (else
         (+ 1 (len (cdr lst))))))

; Promedio (average, avg)
(define (avg estudiante)
  (/ (apply + (get-notas estudiante))
     (len (get-notas estudiante))))

; Subir 1 punto a todas las notas menores a 4
; Filtrar solo notas mayores a 4
; Promediar las notas solo mayores a 4

;(define (mayor-a-4? nota)
;  (cond [(> nota 4) #t]

;; fn-get retorna el valor base
;; fn-set aplica el cambio al valor base
;; fn es la operación que se aplica sobre el retorno de fn-get

;; (set-puntaje estudiante new-puntaje)
;; (get-puntaje estudiante)
;; fn: (lambda (x) (x + 1))

(define (adjustEstudiante fn-get fn-set fn estudiante)
  (fn-set estudiante (fn (fn-get estudiante))))

;; Script ejecución
(define mi-estudiante
  (make-estudiante "gonzalo" "martinez" "A-1" (list 7 7 1) 100))

(define mi-estudiante-2
  (adjustEstudiante get-puntaje set-puntaje (lambda (x) (+ x 1)) mi-estudiante))

; input: (list 1 2 3 4)
; output: 2 3 4 1
(define (rotate-left lst)
  (if (null? lst) null
      (append (cdr lst)
              (cons (car lst) null))))

; input: (list 1 2 3 4)
; output: 4 1 2 3
(define (rotate-right lst)
  (if (null? lst) null
      (append (car (reverse lst))
              (cons (cdr lst) null))))