#lang racket

;; Scheme, es un dialecto de LISP
;; LISP fue creado solo para las máquinas IBM 704 (1956)
;; LISP = LIST PROCESSOR -> TODO ES UNA LISTA
;;  Listas se representan por parentesis, (elementos de la lista)
;;  En Lisp TODO ES UNA LISTA, unidad básica de LISP son funciones
;;  EN LISP, TODO SON LISTAS Y FUNCIONES
;;  Funciones se almacenan en una lista, las funciones parametros de entrada que son listas
;;  Funciones tienen retornos, son listas.
;; Scheme: .rkt

;; Hay dos formas de escribir una función

;; V1 para escribir funciones con args (70s)
(define (hola-mundo arg1) ;; Al momento de ejecutar esta linea, en RAM se almacena un simbolo hola-mundo 
  (list arg1 1 2 3 4))

;; V2 para escribir funciones con args (50s)
(define hola-mundo-2
  (lambda (arg1)     ;; (lambda (x) (operacion x))
    (list arg1 1 2 3 4)))

;; (define hola-mundo-2 (lambda (arg1 arg2)
;;      (operacion arg1 arg2))
;; lambda(x) = x 

(define mi-fn-sin-args (list 1 2 3 4))

;; LISP = Lost in a Sea of Parenthesis

;; Script de ejecución
(hola-mundo "gonzalo")
(hola-mundo-2 "gonzalo2")

mi-fn-sin-args

;; Listas: son de tipo dinamico, pensamos en simbolos

;; Como crear una lista
(list "gonzalo" 123 (list 1 2 3 4))

;; otros lenguajes: primer elemento = lista[0]  first: 70s,
;; en scheme/lisp no hay indices
;; IBM 704 ->
;;    RAM = CAR (cartridge a registry) y CDR (cartrige decremental registry)

;; car = siempre va a retornar el primer elemento de la lista
;; List a b = (a . (b. Null))
;; List a b c = (a . (b . (c . Null)))
;; List 1 2 3 4 = (1 . (2 . (3. (4. Null)))): una lista es una tupla de tuplas
;;    car = 1, entrega primer elemento de la tupla
;;    cdr = el segundo elemento de la tupla, (2 . (3. (4. null))) = (2 3 4)

(car (list 1 2 3 4))
(cdr (list 1 2 3 4))

;; (1 . (2 . (3. (4. Null)))) = L
;; car L = 1
;; cdr L = (2 . (3 . (4. null)))
;; (car (cdr L)) = 2
;; (cdr (cdr L)) = (3 . (4. null))
;; (car (cdr (cdr L))) = 3
;;  (cdr (cdr (cdr L ) = (4. null)
;; (car (cdr (cdr (cdr L )))) = 4
;;  (cdr (cdr (cdr (cdr L ) = None (null)
; (car (cdr (cdr (cdr (cdr L ) = null

(car (list 1 2 3 4))
(cadr (list 1 2 3 4))
(caddr (list 1 2 3 4))
(cadddr (list 1 2 3 4))

;; first, second, third, fourth

;; TDA Funcional
;; Alumno = Nombre X Rut X PEP1

;; Constructor
(define (make-alumno nombre rut pep1)
  (list nombre rut pep1))

;; Selectora
(define (get-nombre alumno)
  (car alumno))

(define (get-rut alumno)
  (cadr alumno))

(define (get-pep1 alumno)
  (caddr alumno))

;; Capa modificadora: Set
;; cambiar la nota de la pep 1
;; implica crear DE NUEVO AL ALUMNO
(define (set-pep1 alumno new-pep1)
  (make-alumno (get-nombre alumno)
               (get-rut alumno)
               new-pep1))

(define (set-nombre alumno new-nombre)
  (make-alumno new-nombre
               (get-rut alumno)
               (get-pep1 alumno)))

(define (set-nombre-rut alumno new-nombre new-rut)
  (make-alumno new-nombre
               new-rut
               (get-pep1 alumno)))
               


;; Ejecucion
(make-alumno "18" "gonzalo" 3)
(define mi-estudiante-1 (make-alumno "gonzalo" 18 3))

mi-estudiante-1
(get-nombre mi-estudiante-1)
(get-rut mi-estudiante-1)
(get-pep1 mi-estudiante-1)


(define mi-estudiante-2 (set-pep1 mi-estudiante-1 7))
mi-estudiante-2

(define mi-estudiante-3 (set-nombre mi-estudiante-2 "Gonzalo Martinez"))
mi-estudiante-3

(define mi-estudiante-4 (set-nombre-rut mi-estudiante-3 "Martinez" "19"))
mi-estudiante-4







