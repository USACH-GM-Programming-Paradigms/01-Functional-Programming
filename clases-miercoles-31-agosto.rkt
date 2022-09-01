#lang racket

;Loa quiere implementar un nuevo sistema de administración de las personas
;que componen la universidad.
;Cada persona se compone de un rut, nombre, apellido.
;Por otro lado cada persona puede ser Estudiante o Funcionario.
;Si es estudiante. posee un listado de notas y
;un listado de cuantas veces ha rendido cada asignatura.
;En cambio el funcionario presenta un listado de los sueldos que ha recibido.

; TDA: Persona
;; Representación:  rut X nombre X apellido X Estudiante | Funcionario

;; Estudiante: rut X nombre X apellido X lista registro ramos X lista notas
;; Funcionario: rut X nombre X apellido X lista sueldos

(define (estudiante rut nombre apellido lst-ramos lst-notas)
  (list rut nombre apellido lst-ramos lst-notas))



(define (persona-v1 rut nombre apellido . args)
  (display args))

; constructor dinámico
(define (persona rut nombre apellido . args)
  (list rut nombre apellido args))

; lista dinamica
(define (make-lst . args) args)
(make-lst 12 3 4 5 1 99 4 8 17 "holi" "chaoli")

(estudiante "18" "gonzalo" "martinez" (list 1 2 3 4) (list 1 2 3 4))
;(funcionario "18" "gonzalo" "martinez" (list "1 chillion de dolares"))

(persona "18" "gonzalo" "martinez" (list 1 2 3) (list 4 5 6))

;; Constructor
(define (funcionario rut nombre apellido lst-sueldos)
  (list rut nombre apellido lst-sueldos))

; Ejemplo:
(define f1 (funcionario "18" "gonzalo" "martinez" (list "1 chillion de dolares")))

;; Selector (get)
(define (get-rut lst) (car lst))
(define (get-nombre lst) (cadr lst))
(define (get-apellido lst) (caddr lst))
(define (get-sueldos lst) (cadddr lst))

;; Pertenencia (?)

;; Modificador (set)
(define (set-rut mi-funcionario new-rut)
  (funcionario new-rut
               (get-nombre mi-funcionario)
               (get-apellido mi-funcionario)
               (get-sueldos mi-funcionario)))

(define f2 (set-rut f1 "20"))

(define (set-nombre mi-funcionario new-nombre)
  (funcionario (get-rut mi-funcionario)
               new-nombre
               (get-apellido mi-funcionario)
               (get-sueldos mi-funcionario)))

(define f3 (set-nombre f2 "gonzalo2"))

;; Otras funciones

;; Agregar elemento a lista
;; (100 200) valor -> (100 200 valor)

;; Tipo de recursion: natural o rec tail
;; natural: dejar estados pendientes
;; rec tail: tengo un argumento en la función que acumula el resultado
;; (define myfn old-lst element new-lst)

;; (myfn (list 1 2 3) 4) : (list 1 2 3 4)
;; (1 . (2 .( 3. null))) : (1 . (2. (3. (4. null))))
;; car: 1
;; cdr: (2 . (3 . null))
;;;  car: 2
;;;  cdr: (3 . null)
;;;;;;; car: 3
;;;;;;;; cdr: null


;; Agregar un elemento a una lista
; Natural Recursion
(define (list-append old-list new-el)
  (cond [(null? old-list) (list new-el)]
        [else (cons (car old-list) 
                    (list-append (cdr old-list) new-el))]))

;(list-append '(b c) 'a)

(list-append (list 1 2 3) 8)
(list-append (list 1 2 3) (cons 4 5))
(list-append (list (cons 1 2) (cons 2 3)) (cons 4 5))

(define (move-lst-into-new-lst lst-in lst-out)
  (cond [(null? lst-in) lst-out]
        [else (move-lst-into-new-lst (cdr lst-in)
                    (list-append lst-out (car lst-in)))]))

(move-lst-into-new-lst (list 1 2 3 4) (list))

;; Dado un empleado agregar un nuevo sueldo

(define (add-new-sueldo mi-funcionario new-sueldo)
  (funcionario (get-rut mi-funcionario)
               (get-nombre mi-funcionario)
               (get-apellido mi-funcionario)
               (list-append (get-sueldos mi-funcionario)
                            new-sueldo))) 

(define f1-nuevo-sueldo (add-new-sueldo f1 9999))
f1-nuevo-sueldo
(define f1-nuevo-sueldo-2 (add-new-sueldo f1-nuevo-sueldo 2100))
f1-nuevo-sueldo-2

;; Dada una lista de sueldos, obtener solo los mayores a 10000

;; obtener todos los sueldos menores a 500
(define lst-sueldos (list 100 200 300 400 500 600 700 800 100 100 100 100))

;; Obtener todos los sueldos menos los que sean 100
(define (compress lst valor)
  (filter (lambda (x)(not(eq? x valor))) lst))

(compress lst-sueldos 100)

;; Obtener el largo de una lista
;(define (len lst contador)
;  (

(define (len lst contador)
  (cond [(null? lst) contador]
        [else (len (cdr lst) 
                   (+ contador 1))]))


(len (list 1 2 3) 0)   

lst-sueldos

(define (count-element lst element)
  (len (filter (lambda (x)(eq? x element)) lst) 0))

(count-element lst-sueldos 100)

;; Histograma
;; ( (s1 count(s1 lst))
;;     (s2 count(s2 lst)) )

;; (list 100 200 300 100 100)
;; Histograma; ( (100 3) (200 1) (300 1) )
;;             (list (cons 100 3) (cons 200 1) (cons 300 1))
;;             (list (cons (car lst) (count-element lst (car lst)))

;; lst-out inicia como lista vacia
;; TODO: aplicar filtro para reducir espacio de búsqueda
(define (histograma lst-in lst-out)
  (cond [(null? lst-in) lst-out]
        [else (histograma (cdr lst-in)
                          (list-append lst-out
                                       (cons (car lst-in)
                                             (count-element lst-in (car lst-in)))))]))

(histograma (list 300 100 200 100) (list))

(sort (list 700 800 6 1 89 2 0) >)
(sort (list 700 800 6 1 89 2 0) <)

;; Promedio:
; (avg (list 1 2 3 4))
(define (avg lst)
  (/ (apply + lst)
     (len lst 0)))

;; (list 1 1 2 3 5 6 7 4 3)
;; Subir un punto a solo las notas menores a 4 y
;; utilizando solo estas notas, calcular el promedio.

;;(myfuncion (list 1 1 2 3 5 6 7 4 3))
(define (myfuncion lst)
  (avg (map (lambda(x)(+ x 1))
            (filter (lambda (x)(< x 4)) lst))))

(myfuncion (list 1 1 2 3 5 6 7 4 3))