#lang racket

(require "01-TDA-Alumno_MiRut.rkt")
(require "02-TDA-Notas_MiRut.rkt")

;; Work in progress
;; Script de pruebas

; Creación de un alumno (miAlumno)

(define mi-alumno (make-alumno "gonzalo" (make-notas 3 4 5)))
(define mi-alumno-nombre (get-nombre mi-alumno))
(define mi-alumno-notas (get-notas mi-alumno))
(define mi-alumno-newnombre (set-nombre mi-alumno "chalo martinez"))
(define mi-alumno-newnotas (set-notas mi-alumno (make-notas 7 6 5)))

(define mi-alumno-newnota-pep1
  (set-notas mi-alumno
             (set-pep1 (get-notas mi-alumno)
                       7)))

(define mi-alumno-newnota-pep2
  (set-notas mi-alumno
             (set-pep2 (get-notas mi-alumno)
                       7)))

(define mi-alumno-newnota-pep3
  (set-notas mi-alumno
             (set-pep3 (get-notas mi-alumno)
                       7)))

(define mi-alumno-promedio-notas
  (calculate-avg (get-notas mi-alumno)))

(define mi-alumno-newnota-pep3-promedio-notas
  (calculate-avg (get-notas mi-alumno-newnota-pep3)))

(define mi-alumno-solo-con-notas-mayor-a-4
  (make-alumno (get-nombre mi-alumno)
               (filter-notas-greater-than-4 (get-notas mi-alumno))))

(define mi-alumno-solo-con-notas-mayor-o-igual-a-4
  (make-alumno (get-nombre mi-alumno)
               (filter-notas-eq-and-greater-than-4 (get-notas mi-alumno))))


(define mi-alumno-como-string (alumno->string mi-alumno))

; Ejecución de las pruebas
mi-alumno
mi-alumno-nombre
mi-alumno-notas
mi-alumno-newnombre
mi-alumno-newnotas

mi-alumno-newnota-pep1
mi-alumno-newnota-pep2
mi-alumno-newnota-pep3

mi-alumno-promedio-notas
mi-alumno-newnota-pep3-promedio-notas

mi-alumno-solo-con-notas-mayor-a-4
mi-alumno-solo-con-notas-mayor-o-igual-a-4

mi-alumno-como-string