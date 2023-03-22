#lang racket

(provide make-notas)
(provide get-pep1 get-pep2 get-pep3)
(provide set-pep1 set-pep2 set-pep3)
(provide calculate-avg) ; Ejemplo de apply
(provide filter-notas-greater-than-4 filter-notas-eq-and-greater-than-4) ; Ejemplo de filter
(provide notas->string)

;; TDA Nota

;; Representación:
;;; Notas = List (PEP1 X PEP2 X PEP3)
;;; PEP1 = number
;;; PEP2 = number
;;; PEP3 = number

; Capa Constructor

;; Descripción: Construye notas
;; Dom: PEP1 X PEP2 X PEP3
;; Rec: Notas
;; Ejemplo: (notas 3 4 5)
;; Output: (3 4 5)
(define make-notas
  (lambda (pep1 pep2 pep3)
    (list pep1 pep2 pep3)))

; Capa Selector

;; Descripción: Obtiene PEP1 del alumno
;; Dom: Notas
;; Rec: PEP1 (number)
;; Ejemplo: (get-pep1 notas)
;; Output: 3
(define (get-pep1 notas) (car notas))

;; Descripción: Obtiene PEP2 del alumno
;; Dom: Notas
;; Rec: PEP2 (number)
;; Ejemplo: (get-pep2 notas)
;; Output: 4
(define (get-pep2 notas) (cadr notas))

;; Descripción: Obtiene PEP3 del alumno
;; Dom: Notas
;; Rec: PEP3 (number)
;; Ejemplo: (get-pep3 notas)
;; Output: 5
(define (get-pep3 notas) (caddr notas))

; Capa Modificador

;; Descripción: Crea notas con nueva nota PEP1
;; Dom: Notas X Nota (number)
;; Rec: Notas
;; Ejemplo: (set-pep1 notas 7) donde notas = (list 3 4 5)
;; Output: (7 4 5)
(define (set-pep1 notas new-pep1)
  (make-notas new-pep1 (get-pep2 notas) (get-pep3 notas)))

;; Descripción: Crea notas con nueva nota PEP2
;; Dom: Notas X Nota (number)
;; Rec: Notas
;; Ejemplo: (set-pep2 notas 7) donde notas = (list 3 4 5)
;; Output: (3 7 5)
(define (set-pep2 notas new-pep2)
  (make-notas (get-pep1 notas) new-pep2 (get-pep3 notas)))

;; Descripción: Crea notas con nueva nota PEP3
;; Dom: Notas X Nota (number)
;; Rec: Notas
;; Ejemplo: (set-pep3 notas 7) donde notas = (list 3 4 5)
;; Output: (3 4 7)
(define (set-pep3 notas new-pep3)
  (make-notas (get-pep1 notas) (get-pep2 notas) new-pep3))

; Capa: Otros

;; Descripción: Calcula el promedio (avg, average) de las notas
;; Dom: Notas
;; Rec: number (Promedio = number)
;; Ejemplo: (calculate-avg notas) donde notas = (list 3 4 5)
;; Output: 4 (Porque 3+4+5= 12 / len(notas) = 12/3 = 4
(define (calculate-avg notas)
  (/ (apply + notas) (length notas)))

;; Descripción: Obtiene solo las notas mayores 4 (Filtra las notas mayores a 4)
;; Dom: Notas
;; Rec: Notas
;; Ejemplo: (filter-notas-greater-than-4 notas) donde notas = (list 3 4 5)
;; Output: (4 5)
(define (filter-notas-greater-than-4 notas)
  (filter (lambda (x) (> x 4)) notas))


;; Descripción: Obtiene solo las notas igual o mayores 4 (Filtra las notas igual o mayores a 4)
;; Dom: Notas
;; Rec: Notas
;; Ejemplo: (filter-notas-greater-than-4 notas) donde notas = (list 3 4 5)
;; Output: (4 5)
(define (filter-notas-eq-and-greater-than-4 notas)
  (filter (lambda (x)
            (or (= x 4)
                (> x 4)))
          notas))

;; Descripción: Convierte las Notas (lista de numbers) en un solo string
;; Dom: Notas
;; Rec: str
;; Ejemplo: (notas->string (list 2 3 4))
;; Output: ("2" "3" "4")
(define (notas->string notas)
  (string-join (map (lambda (x) (number->string x)) notas)))
