#lang racket

(require "02-TDA-Notas_MiRut.rkt") ; Para poder imprimir todo Alumno en un solo str

(provide make-alumno)
(provide get-nombre get-notas)
(provide set-nombre set-notas)
(provide alumno->string)

;; TDA Alumno

;; Representación:
;;; Alumno = List (Nombre X Notas)
;;; Nombre = string
;;; Notas = List (TDA Notas)

; Capa Constructor

;; Descripción: Construye alumno
;; Dom: Nombre(tambien puedo escribir str) X List Nota
;; Rec: Alumno
;; Ejemplo: (make-alumno gonzalo (make-notas 3 4 5))
;; Output: ("gonzalo" (3 4 5))
(define make-alumno
  (lambda (nombre notas)
    (list nombre notas)))

; Capa Selector

;; Descripción: Obtiene nombre del alumno
;; Dom: Alumno
;; Rec: Nombre (str)
;; Ejemplo: (get-nombre miAlumno)
;; Output: "gonzalo"
(define (get-nombre alumno) (car alumno))

;; Descripción: Obtiene notas del alumno
;; Dom: Alumno
;; Rec: Notas
;; Ejemplo: (get-notas miAlumno)
;; Output: (1 2 3)
(define (get-notas alumno) (cadr alumno))

; Capa Modificador

;; Descripción: Crea alumno con nuevo nombre
;; Dom: Alumno X Nombre (str)
;; Rec: Alumno
;; Ejemplo: (set-nombre mi-alumno "gonzalo martinez")
;; Output: ("gonzalo martinez" (3 4 5))
(define (set-nombre alumno new-nombre)
  (make-alumno new-nombre (get-notas alumno)))

;; Descripción: Crea alumno con nuevas notas
;; Dom: Alumno X Nombre (str)
;; Rec: Alumno
;; Ejemplo: (set-nota mi-alumno (4 5 6))
;; Output: ("gonzalo" (4 5 6))
(define (set-notas alumno new-notas)
  (make-alumno (get-nombre alumno) new-notas))

; Capa Otros

;; Descripción: Convierte el Alumno en un solo string
;; Dom: Alumno
;; Rec: str
;; Ejemplo: (notas->string (list 2 3 4))
;; Output: ("2" "3" "4")
(define (alumno->string alumno)
  (string-append (get-nombre alumno)
                 " "
                 (notas->string (get-notas alumno))))
