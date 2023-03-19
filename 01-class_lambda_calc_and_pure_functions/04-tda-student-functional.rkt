;; WIP (work in progress)

;; Data Type Alumno:
;; Type Alumno = List Nombre X Notas
;; Type Nombre = str
;; Type Notas = List Nota
;; Type Nota = number

; Alumno
; Capa constructora
;; Dom: Nombre X Notas
;; Rec: Alumno
(define (make-alumno nombre notas)
    (list nombre notas))

; Capa selectora

;; Dom: Alumno
;; Rec: str
(define (get-nombre alumno) (car alumno))

;; Dom: Alumno
;; Rec: Notas
(define (get-notas alumno) (cadr alumno))