#lang racket

; 50: LISP, 70s: SCHEME   / RACKET
; SEMICOLON ES COMENTARIO
; LISP = LIST PROCESSOR | LOST IN A SEA OF PARENTHESIS
(define mi-funcion-1
  (lambda (miArgumento)
    (display miArgumento)))

; Dom: nombre (str) X pep1(number) X pep2(number) X pep3
; Rec: Alumno (list)
(define (make-alumno nombre pep1 pep2 pep3)
  (list nombre pep1 pep2 pep3))

(define (get-nombre alumno)
  (car alumno))

(define (get-pep1 alumno)
  (second alumno))

(define (get-pep2 alumno)
  (caddr alumno))

(define (get-pep3 alumno)
  (cadddr alumno))

(define (set-pep1 alumno new-pep1)
  (make-alumno (get-nombre alumno)
               new-pep1
               (get-pep2 alumno)
               (get-pep3 alumno)))

;; (define nombreFuncion
;;   (lambda (arg1 arg2 argn)
;;       (cuerpo funcion))))

         
;; (car (cdr)
;; (cadr)

;; 50 -> CAR: Content Address Registry
;;       CDR: Content Decrement Registry
;; CAR ENTREGA EL PRIMER ELEMENTO DEL PAR
;; CDR ENTREGA TODO LO QUE SIGUE 

; cons a b = (a . b)
; List a = null | Cons a List a
; List a b c = (a . (b . (c . null)))
; List a b c = (cons a (cons b (cons c null)))
; cantidad de d's= (posicion del elemento a obtener - 1)

(define (first lst)
  (car lst))

;; Ejecucion
(define a1 (make-alumno "gonzalo" 1 2 3))
a1
(get-nombre a1)
(get-pep1 a1)
(get-pep2 a1)

(define a2 (set-pep1 a1 7))
a2

(define a3 (make-alumno "benjamin" 1 1 1))
(define a4 (make-alumno "diego" 7 1 1))
(define a5 (make-alumno "duvan" 1 1 1))

(define (sistema . alumnos)
  (list (current-seconds) alumnos))

(define (make-producto nombre precio)
  (list (current-seconds) nombre precio))

(define p1 (make-producto "reloj" 10))

(define (add-element element lst)
  (cons element lst))

;; a2 -> (set-pep1 a1 7)
;;       (set-pep1 (make-alumno "gonzalo" 1 2 3) 7)
;;;      (set-pep1 (list "gonzalo 1 2 3) 7)
