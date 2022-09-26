#lang racket

; Descripción: transforma una lista de números a un solo valor string
; Dom: lista de números
; Rec: string
; Ejemplo:(lst-numbers->string (list 1 2 3 4))
; "1234"
(define (lst-numbers->string lst-numbers)
  (apply string-append (map number->string lst-numbers)))

; Descripción: transforma una lista de elementos(números y/o strings) a un sólo valor string
; Dom: lista de números y/o strings
; Rec: string
; Ejemplo: (lst-elements->string (list 1 2 3 4))
; "1234"
; Ejemplo: (lst-elements->string (list 1 "holi" 3 "chaoli"))
;"1holi3chaoli"
(define (lst-elements->string lst-elements)
  (apply string-append (map element->string lst-elements)))

; Descripción: verifica si el elemento es número, si lo es, lo transforma a string
;; Si el elemento es una lista, vuelve a llamar lst-elements->string
;; Si el elemento es number, lo deja tal cual
; Dom: elemento (string o number)
; Rec: string
; Ejemplo: (element->string 1)
; "1"
; Ejemplo: (element->string "holi")
; "holi"
(define element->string
  (lambda (element)
    (cond [(number? element) (number->string element)]
          [(list? element) (lst-elements->string element)]
          [else element])))

;; (alto ancho (list pixeles)
;; donde: (list pixeles) = (list (list 0 0 1 2 3 4) (list 0 1 1 2 3 4))
;; (list 2 2 (list (list 0 0 1 2 3 4) (list 0 1 1 2 3 4)))
;; Output: "22001234011234"

; Guardo la lista de listas en un simbolo
(define lst-with-lsts-example (list 2 2 (list (list 0 0 1 2 3 4) (list 0 1 1 2 3 4))))

(lst-elements->string lst-with-lsts-example)

;; TDA Imagen
;;(define image (lambda (alto ancho . pixels) (list alto ancho pixels)))

;; Una función que opera con map y el procedimiento se aplica como lambda
(define (edit fn image)
  (map (lambda (element) (if (list? element)
                             (map fn element)
                             element))
       image))

(define (invertColorBit pixel)   
  (cond [(zero? pixel) 1]
        [else 0]))

;(define (deep-map f l)
;  (define (deep x)
;    (cond ((null? x) x)
;          ((pair? x) (map deep x))
;          (else (f x))))
;  (map deep l))

;(define (deep-map f l)
;  (define (deep x)
;    (cond ((null? x) x)
;          ((list? x) (map deep x))
;          (else x)))
;  (map deep l))

(edit invertColorBit (list 1 2 (list 0 0 1 10) (list 0 1 0 20)))

(define (myFn x y . pixels) pixels)

(myFn 1 2 0 0 1 0 10)

; Descripcion: funcion que recibe un string y realiza un append a un
;              str predefinido
; DOM: str
; REC: str
; Ejemplo: (say-hello "gonzalo")
(define say-hello
  (lambda (name)
    (string-append "Hello " name "!")))

; Ejemplo: (say-hello "gonzalo")
(define say-hello-long-message
  (lambda (nombre)
    (string-append "Hola " nombre " como estas?" " Bien y tu")))

; Concatenar lista de strings a traves de recursion de cola
(define concatenar
  (lambda (lst acc) 
    (cond
      [(null? lst) acc]
      [else
       (concatenar (cdr lst)
                   (string-append acc (car lst)))])))
             
(concatenar (list "hola" "mi" "mundo") "")

; Concatenar lista de strings a traves de recursion natural
(define concatenar-rec-nat
  (lambda (lst) 
    (cond
      [(null? lst) ""]
      [else
       (string-append (car lst)
                      (concatenar-rec-nat (cdr lst)))])))
             
(concatenar-rec-nat (list "hola" "mi" "mundo"))