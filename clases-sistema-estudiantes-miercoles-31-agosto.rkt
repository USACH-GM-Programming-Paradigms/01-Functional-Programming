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

;; 1a
;; Defina e implemente el TDA persona

;; TDA estudiante

;; Constructor
(define (estudiante rut nombre apellido lst-ramos lst-notas)
  (list rut nombre apellido lst-ramos lst-notas))

;; Constructor TDA Persona
;; Uso de listas dinámicas (. args), todo lo que viene después del punto es considerado una lista
(define (persona-v1 rut nombre apellido . args)
  (display args))

; constructor dinámico
(define (persona rut nombre apellido . args)
  (list rut nombre apellido args))

; lista dinamica
(define (make-lst . args) args)
(make-lst 12 3 4 5 1 99 4 8 17 "holi" "chaoli")

; ejemplo de constructor utilizando una lista dinámica
; la consecuencia de esto es que podemos tener funciones de aridad n (n cantidad de argumentos)
(estudiante "18" "gonzalo" "martinez" (list 1 2 3 4) (list 1 2 3 4))
;(funcionario "18" "gonzalo" "martinez" (list "1 chillion de dolares"))

(persona "18" "gonzalo" "martinez" (list 1 2 3) (list 4 5 6))

;; TDA funcionario
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
;; Las funciones de pertenecia son predicados, puesto que retornan true or false
(define (is-rut? rut)
  (cond [(string? rut) #t]
        [else #f]))

;; Modificador (set)
;; La capa modificadora ocupa el constructor para crear un nuevo TDA
;; Se crea un nuevo TDA con un nuevo valor que es el que se desea modificar
(define (set-rut mi-funcionario new-rut)
  (funcionario new-rut
               (get-nombre mi-funcionario)
               (get-apellido mi-funcionario)
               (get-sueldos mi-funcionario)))

;; Asociandolo a un simbolo
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


;; Descripción: Agrega un elemento a una lista
;; Dom: lista X elemento
;; Rec: lista
;; Tipo de recursión: Natural Recursion
;; Lo que hace es crear una nueva lista con el nuevo elemento en el último lugar
(define (list-append old-list new-el)
  (cond [(null? old-list) (list new-el)]
        [else (cons (car old-list) 
                    (list-append (cdr old-list) new-el))]))

;(list-append '(b c) 'a)

(list-append (list 1 2 3) 8)
(list-append (list 1 2 3) (cons 4 5))
(list-append (list (cons 1 2) (cons 2 3)) (cons 4 5))

;; Descripción: Copiar una lista a otra lista
;; Dom: lista X lista
;; Rec: lista
;; Tipo de recursión: Natural Recursion
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

;; Dada una lista de sueldos, obtener solo los mayores a cierto valor

;; obtener todos los sueldos menores a 500
(define lst-sueldos (list 100 200 300 400 500 600 700 800 100 100 100 100))

;; Obtener todos los sueldos menos los que sean 100
;; Descripción: A partir de una lista, filtra todos los valores que no sean x
;; Dom: lista X simbolo
;; Rec: lista
(define (compress lst valor)
  (filter (lambda (x)(not(eq? x valor))) lst))

(compress lst-sueldos 100)

;; Obtener el largo de una lista
;; Descripción: Obtener el largo de una lista
;; Dom: lista X number
;; Rec: number
;; Tipo de recursión: Recursión de cola
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

;; Descripción: Crea un histograma de acuerdo a la lista de entrada
;;   Un histograma es de la forma (simbolo cantidad-ocurrencias-del-simbolo)
;;   Donde cantidad-ocurrencias-del-simbolo equivale a la cantidad de veces que dicho simbolo aparece
;;   en la lista pasada como entrada
;; Dom: lista X lista
;; Rec: lista
;; Tipo de recursión: Recursión de Cola (Tail Recursion)
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


;[Estudiante y Funcionario] El sistema quiere mover los registros tanto de notas como sueldos hacia 
; la izquierda, es decir:
;[a b c d] -> [b c d a]

; input: (list 1 2 3 4)
; output: 2 3 4 1
; input: (rotate-left (list 1 2 3 4))
(define (rotate-left lst)
  (if (null? lst) null
      (append (cdr lst)
              (cons (car lst) null))))

; (list 1 2 3 4): ( 2 3 4 1 ) ; left
; ( 4 1 2 3 )
(rotate-left (list 1 2 3 4))

;[Estudiante y Funcionario] El sistema quiere mover los registros tanto de notas como sueldos hacia
; la derecha, es decir:
;[a b c d] -> [d a b c] 

(define (rotate-right lst)
  (rotate-left (rotate-left (rotate-left lst))))

(rotate-right (list 1 2 3 4))

;[Estudiante] Implementar la siguiente función:
;Subir un punto a solo las notas menores a 4 y utilizando solo estas notas, calcular el promedio.

(define (subir-punto-menor4-avg lst)
  (avg (map (lambda(x)(+ x 1))
            (filter (lambda (x)(< x 4)) lst))))

(subir-punto-menor4-avg (list 1 1 2 3 5 6 7 4 3))


;[Estudiante] Retornar la información del estudiante, pero sin las notas que han obtenido 
; la mayor ocurrencia/frecuencia.

(define (get-nota-from-pair pair) (car pair))
(define (get-freq-from-pair pair) (cdr pair))

; par ordenado: (2 . 5): nota 2 frecuencia 5
(get-nota-from-pair (cons 2 5))
(get-freq-from-pair (cons 2 5))

;; Descripción: Ordena una lista de pares (pairs, cons) de forma DESCENDENTE (>) 
;;              de acuerdo al segundo valor del par.
;;              El segundo valor del par equivale a la frecuencia de cada valor
;; Dom: lista de pares
;; Rec: lista de pares
(define (sort-desc-by-second lst)
  (sort lst
        (lambda (x y) (> (cdr x) (cdr y)))))

; ordena las frecuencias (2do valor) de mayor a menor (DESCENDENTE)
(sort-desc-by-second '((1 . 1) (2 . 3) (3 . 2)))

(car (sort-desc-by-second '((1 . 1) (2 . 3) (3 . 2))))

(car (car (sort-desc-by-second '((1 . 1) (2 . 3) (3 . 2)))))
(cdr (car (sort-desc-by-second '((1 . 1) (2 . 3) (3 . 2)))))

; cómo se encuentra ordenado de mayor a menor, el elemento con más frecuencia se encuentra en la primera posición

(define (get-nota-mayor-freq lst)
  (get-nota-from-pair (car (sort-desc-by-second lst))))

; la lista de pares ES EL HISTOGRAMA
(get-nota-mayor-freq '((1 . 1) (2 . 3) (3 . 2)))

(get-nota-mayor-freq (histograma (list 300 100 200 100) (list)))

;[Estudiante] Retornar la información del estudiante, pero sin las notas que han obtenido 
; la menor ocurrencia/frecuencia.

;; Descripción: Ordena una lista de pares (pairs, cons) de forma ASCENDENTE (<) 
;;              de acuerdo al segundo valor del par.
;;              El segundo valor del par equivale a la frecuencia de cada valor
;; Dom: lista de pares
;; Rec: lista de pares
(define (sort-asc-by-second lst)
  (sort lst
        (lambda (x y) (< (cdr x) (cdr y)))))

; ordena las frecuencias (2do valor) de menor a mayor (ASCENDENTE)
(sort-asc-by-second '((1 . 1) (2 . 3) (3 . 2)))


(define (get-nota-menor-freq lst)
  (get-nota-from-pair (car (sort-asc-by-second lst))))

; la lista de pares ES EL HISTOGRAMA
(get-nota-menor-freq '((1 . 1) (2 . 3) (3 . 2)))


(get-nota-menor-freq (histograma (list 300 100 200 100) (list)))
