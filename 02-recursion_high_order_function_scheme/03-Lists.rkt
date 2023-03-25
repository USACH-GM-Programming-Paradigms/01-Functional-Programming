#lang racket

;; Listas y Recursion

;; car: selecciono primer elemento de la lista
;; cdr: obtengo una lista que contiene el resto de elementos después del primero

; Recursion Natural
; Ejemplo: (sumatoria-natural 10)
(define sumatoria-natural
  (lambda (n)
    (cond
      [(zero? n) 0]
      [else (+ n (sumatoria-natural (- n 1)))])))


; Recursion de Cola (Tail Recursion)
; Ejemplo: (sumatoria-tail 10)
(define (sumatoria-tail n)
  (define sumatoria-interna
    (lambda (n acc)
      (cond
        [(zero? n) acc] ; for(i=0;condición parada)
        [(sumatoria-interna (- n 1) (+ n acc))])))
  (sumatoria-interna n 0))

(sumatoria-natural 10)
(sumatoria-tail 10)


;; Listas

;; Las listas se construyen con la función list
(list "esto" "es un" "ejemplo" "de" "lista")

;; Para acceder a elementos de la lista, se hace uso de car y cdr
;; No obstante, hay forma de abreviar esto, pero hay un limite
;; car selecciona el elemento
;; cdr retorna sublista del siguiente elemento en adelante
;; (define primero car)
;; (define segundo (car (cdr))
;; (define tercero (car (cdr (cdr)) y asi

(define get-first car)
(define get-second cadr)
(define get-third caddr)
(define get-fourth cadddr) ;; Obtiene 4to elemento, despues de esto ya no se puede seguir abreviando

(define mi-lista (list 1 2 3 4 5))
(display "obtengo elemento 1: " )
(display "")
(get-first mi-lista)
(display "obtengo elemento 2: " )
(display "")
(get-second mi-lista)
  

;; (list arg1 arg2 arg3) construye una lista basado en argumentos fijos, es decir, se sabe la cantidad de argumentos
;; si quiero construir una lista con n argumentos, debo usar la función dot (punto, .)
;; (. argumentos)
;; lo que hace es recibir simbolos/elementos, y retorna una lista basado en ello

(define (lst-builder . lst) lst)

(lst-builder "hola" "esto" "es" "una" "lista" "con" "n" "argumentos")
(lst-builder 1 2 "hola" 1000 (list "tambien" "puedo" "pasar" "listas"))


;; Operaciones con listas

;; Verifica si un elemento pertenece a una lista
;; Esto corresponde a una función de capa de pertenencia de un TDA
;; Dom: e (elemento) X lst (List)
;; Rec: Boolean
;; Recursion de cola (Tail Recursion)
;; (element-in-lst? 2 (list 1 2 3))
(define (element-in-lst? e lst)
  (cond [(null? lst) #f]
        [(equal? e (car lst)) #t]
        [else (element-in-lst? e (cdr lst))]))
   
(element-in-lst? 2 (list 1 2 3))

;; Agregar elemento a la lista

;; Takes an element and a list as input and returns a new list with the element added to the front
(define (add-to-front-of-list elem lst)
  (cons elem lst))

(add-to-front-of-list 3 (list 1 2 3 4))
(add-to-front-of-list "apple" '("orange" "banana"))

;; Takes an element and a list as input and returns a new list with the element added to the end
(define (add-to-end-of-list elem lst)
  (if (null? lst)
      (list elem)
      (cons (car lst) (add-to-end-of-list elem (cdr lst)))))

(add-to-end-of-list 1 '(2 3 4))
(add-to-end-of-list "apple" '("orange" "banana"))

;; También podemos realizarlo de forma declarativa utilizando features del lenguaje
(define (append-declarative elem lst)
  (reverse (cons elem (reverse lst))))

(append-declarative 100 (list 1 2 3 4))

;; Si quiero UNIR (join) listas, puedo usar la funcion interna de Scheme, llamada append
;;  (append lst1 lst2)

(append '(1 2 3) '(4 5 6)) ; Returns: (1 2 3 4 5 6)
(append '(1 2 3) '()); Returns: (1 2 3)


;; Borrar un elemento de una lista

(define (delete-element e lst)
  (cond [(null? lst) '()]                 ; If list is empty, return empty list
        [(equal? e (car lst)) (cdr lst)]  ; If first element of list matches str, skip it
        [else (cons (car lst)             ; Otherwise, keep first element and continue
                    (delete-element e (cdr lst)))]))

(delete-element "world" '("hello" "world")) ; Returns: ("hello")

;; Preguntar si un elemento pertenece o no a una lista
;; Retornar un True si pertenece, False si no

;; Pertenece?: Esto corresponde a la capa de pertenencia de un TDA
;; (member element lst) retorna una sublista de lst que comienza desde el elemento encontrado

(define (member? e lst)
  (if (null? lst) #f                                
      (if (equal? e (car lst)) #t
          (member? e (cdr lst)))))


(member? 3 (list 5 90 3 1)) ; Returns: #t

;; Si quiero convertir una lista en un solo string, puedo usar
;(define (simbolo->string lst-simbolos)
;  (string-append (get-nombre-alumno alumno)
;                 " "
;                 (notas->string (get-notas-alumno alumno))))

;; Si quiero convertir una lista de numeros a str:
;; debo crear una nueva lista con map, convirtiendo cada numero a str con la funcion interna: number->string
;; uso la función string-join y number->string

(define (lst-numbers->string lst)
  (string-join (map (lambda (n) (number->string n)) lst)))

(lst-numbers->string (list 1 2 3 4))

;; Si quiero unir strings en una sola cadena, puedo usar: string-append
(string-append "hola" "mundo")

;; High Order Functions
;; Map - Filter - Apply

;; Filter usa Tail Recursion
(define (mi-filtro pred lst)
  (cond [(null? lst) null]
        [(pred(car lst)) (cons (car lst) (mi-filtro pred (cdr lst)))]
        [else (mi-filtro pred (cdr lst))]))


;; Map

;; Map usa Tail Recursion
;; Usando if-else
(define (mi-map-v1 f lst)
  (if (null? lst)
      '()
      (cons (f (car lst))
            (map f (cdr lst)))))

;; Usando cond, ambos son equivalentes (if-else / cond)
(define (mi-map funcion lista)
  (cond [(null? lista) null]
        [else (cons (funcion (car lista))
                    (mi-map funcion (cdr lista)))]))

;; Apply

;; Apply usa Tail Recursion
(define (mi-apply fn args)
  (if (null? args)
      (fn)
      (mi-apply fn (cdr args) (cons (car args) '()))))
