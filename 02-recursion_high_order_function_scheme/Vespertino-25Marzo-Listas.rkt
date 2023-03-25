#lang racket

;; TDA - Alumno: Capa constructor

;; Dom: Nombre (str) X Notas (List number)
;; Rec: Alumno
(define (make-alumno nombre notas)
  (list nombre notas))

;; Dom: PEP1 (number) X PEP2 (number) X PEP3 (number)
;; Rec: Notas
(define (make-notas pep1 pep2 pep3)
  (list pep1 pep2 pep3))

;; TDA - Alumno - Capa selectora

;; Listas en Scheme:
;; (list 1 2 3 4 5)

; car: funcion que corresponde al selector del primer elemento de una lista
; car: primer elemento de una lista
;; pruebas y controles: caddddddr

(define get-nombre-alumno car)
(define get-notas-alumno cadr) ;; cadr (car (cdr x))

;; Capa modificadora

;; Dom: Alumno X Nombre (str)
;; Rec: Alumno
(define (set-nombre-alumno alumno new-nombre)
  (make-alumno new-nombre (get-notas-alumno alumno)))

(define (set-notas-alumno alumno new-notas)
  (make-alumno (get-nombre-alumno alumno) new-notas))


;; Script prueba

;; S0 : state0

(define S0 (make-alumno "Gonzalo" (make-notas 3 4 5)))
S0

(define S1 (set-nombre-alumno S0 "Gonzalo Martinez"))
S1

(define S2 (set-notas-alumno S1 (make-notas 6 7 8)))
S2

;; Curso
;; Curso - NombreCurso X List Alumno
;; ("Paradigmas" (alumno1 alumno2 alumno3))

(define (make-curso nombre-curso . alumnos)
  (list nombre-curso alumnos))

(define get-alumnos-curso cadr)  ;; (car (cdr alumno))

;; Operacion: obtener todos los nombres de los alumnos del curso
(define (get-all-nombres-alumnos-curso curso)
  (map (lambda (alumno) (get-nombre-alumno alumno))
       (get-alumnos-curso curso)))

;; MAP
;; FILTER
;; APPLY
  
;; .
;; (. arg1 arg2 arg3) = (list arg1 arg2 arg3)

;; (contenedor 1 2 3 4 5)
(define (contenedor . args) args)

(define (fs nombreDrive . files)
  (list nombreDrive files))

(fs "C" "doom1.exe" "doom2.exe" "diablo.exe" "ageofempires.exe")


(define Curso1 (make-curso "Paradigmas" (make-alumno "gonzalo" (list 1 2 3)) (make-alumno "constanza" (list 4 2 3))))
Curso1

(define NombresCurso1 (get-all-nombres-alumnos-curso Curso1))
NombresCurso1
