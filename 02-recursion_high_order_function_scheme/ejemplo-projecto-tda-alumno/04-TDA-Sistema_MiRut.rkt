#lang racket

;; TDA Sistema

(require "01-TDA-Alumno_MiRut.rkt")
(require "02-TDA-Notas_MiRut.rkt")
(require "03-TDA-Alumnos_MiRut.rkt")

; Descripción: función para ejecutar comandos sobre el curso (sistema/contenedor)
; Dom: Curso (List Nombre (str) X List Alumno) X Comando (funcion)
; Ejemplo: (run miCurso miComando)
(define run
  (lambda (curso cmd)
    (cmd curso)))


;; Capa pertenencia
; Descripción: verifica si el alumno ya existe en el curso, para esto solo obtiene el nombre
; Función Currificada
;; Ejemplo: ((exists-alumno? miAlumno) miCurso)

;; The member procedure takes two arguments:
;; an element to search for and a list to search in. It returns the first sublist of the given list that begins with the specified element,
;; or #f if the element is not found in the list.
(define exists-alumno?
  (lambda (curso)
    (lambda (nombre-alumno)
      (cond [member nombre-alumno (map (lambda (alumno) (get-nombre-alumno alumno))
                                       (get-alumnos curso))]
            (#t)
            [else #f]))))

;; RF1. Obtener el nombre de todos los alumnos inscritos en el curso
(define get-all-nombre-alumnos
  (lambda (curso)
    (map (lambda (alumno) (get-nombre-alumno alumno))
         (get-alumnos curso))))

;; RF1. Obtener todos los alumnos que coincidan con el nombre de búsqueda
(define filter-alumnos-by-nombre
  (lambda (curso)
    (lambda (nombre-consulta)
      (filter (lambda (alumno) (eq? (get-nombre-alumno alumno) nombre-consulta))
              (get-alumnos curso)))))




;; RF2. Inscribir alumno
;; Descripción: Función que inscribe un alumno recibiendo su nombre y listado de notas
;; Dom: nombre (str) X notas (list number)
;; Rec: Curso
(define inscribir-alumno
  (lambda (curso)
    (lambda (nombre-alumno notas-alumno)
      (make-curso (get-nombre-curso curso)
                  (cons (make-alumno nombre-alumno notas-alumno)
                        (get-alumnos curso))))))

;; RF3. Desinscribir alumno
;; Descripción: Función que desinscribe un alumno recibiendo su nombre
;; Dom: nombre (str) X notas (list number)
;; Rec: Curso
(define desinscribir-alumno
  (lambda (curso)
    (lambda (nombre-alumno)
      (filter (lambda (str) (eq? (get-nombre-alumno str) nombre-alumno))
              (get-alumnos curso)))))

; Script de prueba
; Creando un Curso
; S0 equivale a State0, es decir, el sistema en estado 0
(define S0 (make-curso "Paradigmas" (make-alumno "David Gilmour" (make-notas 3 4 5)) (make-alumno "James Hetfield" (make-notas 4 5 6))))
;S0

; Inscribir alumno
(define S1 ((run S0 inscribir-alumno) "Gonzalo" (make-notas 3 4 2)))
;S1

(define NombresAlumnosS0 (get-all-nombre-alumnos S0))
;NombresAlumnosS0

(define NombresAlumnosS1 (get-all-nombre-alumnos S1))
;NombresAlumnosS1

(define S3 ((run S0 filter-alumnos-by-nombre) "Gonzalo"))
S3