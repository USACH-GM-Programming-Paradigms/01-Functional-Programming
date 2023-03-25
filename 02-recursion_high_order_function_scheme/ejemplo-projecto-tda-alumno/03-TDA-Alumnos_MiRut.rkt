#lang racket

(provide make-curso)
(provide get-nombre-curso get-alumnos)
(provide set-nombre-curso set-alumnos)


;; TDA Alumnos

;; Representación:
;;; Curso = List (NombreCurso X List Alumno)
;;; NombreCurso = string

; Capa Constructor

;; Descripción: Construye Curso
;; Dom: NombreCurso(tambien puedo escribir str) X List Alumno
;; Rec: Curso
;; Ejemplo: (make-curso "Paradigmas de Programacion" (make-alumno "gonzalo" (make-notas 3 4 5)))
(define (make-curso-sin-alumnos nombre-curso . alumnos)
  (list nombre-curso '()))

(define (make-curso nombre-curso . alumnos)
  (list nombre-curso alumnos))

; Capa Selector

;; Descripción: Obtiene nombre del curso
;; Dom: Curso
;; Rec: NombreCurso (str)
;; Ejemplo: (get-nombre-curso miCurso)
(define (get-nombre-curso curso) (car curso))

;; Descripción: Obtiene alumnos del curso
;; Dom: Curso
;; Rec: List Alumno
;; Ejemplo: (get-alumnos miCurso)
(define (get-alumnos curso) (cadr curso))

; Capa Modificador

;; Descripción: Crea curso con nuevo nombre
;; Dom: Curso X Nombre (str)
;; Rec: Curso
;; Ejemplo: (set-nombre-curso miCurso "paradigmas 2")
(define (set-nombre-curso curso new-nombre)
  (make-curso new-nombre (get-alumnos curso)))

;; Descripción: Crea curso con nuevos alumnos
;; Dom: NombreCurso (str) X List Alumno
;; Rec: Curso
;; Ejemplo: (set-alumnos miCurso new-alumnos)
(define (set-alumnos curso new-notas)
  (make-curso (get-nombre-curso curso) new-notas))
