#lang racket

;;Desarrolle un programa en Scheme que represente un sistema de administración de productos,
;; donde cada producto se compone de su
; -tipo de producto,
; - nombre
; - precio.
;; Donde el tipo de producto puede ser “fruta”, “eléctrico”. 

;; PASO 1: BUSCAR UNA REPRESENTACIÓN

;; type Producto  (AND X) (OR |)
;; Producto = Lista (TipoProducto X Nombre X Precio)  ;; 1er PASO: QUE
;; 2do paso: COMO
;; Producto = Lista (TipoProducto (str) X Nombre (str) X Precio (number) )

;; ----------

;; PASO 2: EN BASE A LA REPRESENTACIÓN CONSTRUIMOS LAS CAPAS DEL TDA

;; CAPA 1 DE UN TDA: CONSTRUCTOR
;; (define (nombre-fn arg1 arg2 argn)



;;En base al contexto previamente mencionado, implemente las siguientes funcionalidades:

;;RF1.Obtener el nombre de un producto. (Selector - get)

;; 1er elemento lista:
;; (car (list 1 2 3 4)) = 1
;; (car (cdr (list 1 2 3 4))) = 2
;; CAR | CDR
;; Pares: (cons a b) = (a . b)
;; Si listas son pares de pares, Lista a b c = (cons a (cons b (cons c null)))
;; car = 1er ELEMENTO DE UNA LISTA/PAR
;; cdr = LISTA RESTO DE ELEMENTOS
;; (car (list 1 2 3 4)) = 1
;; (cdr (list 1 2 3 4)) = (list 2 3 4)  
;; (car (cdr (list 1 2 3 4))) = 2  => cadr
;; (car (cdr (cdr (list 1 2 3 4)) = 3
;; (car (cdr (cdr (cdr (list 1 2 3 4) = 4

;; car = 1ero
;; cadr = 2do
;; caddr = 3ero
;; cadddr = 4to
;; patron: elemento n => d = n  - 1
;; elemento 2 = n - 1 = 2-1 =1 d = cadr
;; elemento 3 = n - 1 = 3-1 = 2 d = caddr
;; limite son 6 d's ;; simplificar en controles/peps; escriban toda la cantidad de d's que puedan

; Dom: tipo-producto(str) X nombre(str) X precio(number)
; Rec: Producto (Lista)
; Ejemplo: (make-producto "fruta" "manzana" 10)
(define (make-producto tipo-producto nombre precio)
  (list tipo-producto nombre precio))

; Dom: Producto/Lista
; Rec: str
(define (get-nombre producto)
  (cadr producto))

;;RF2. Obtener el precio de un producto.
(define (get-precio producto)
  (caddr producto))

;; si quiero obtener el último elemento de una lista:
;; aplico reverse y luego car
;; (car (reverse (list 1 2 3 4)))

;;RF3. Cambiar el precio de un producto. set -> CAPA MODIFICADORA

; Dom: Producto/Lista
; Rec: str
(define (get-tipo producto)
  (car producto))

; Dom: Producto X precio(number)
; Rec: Producto
(define (set-precio producto new-precio)
  (make-producto (get-tipo producto)
                 (get-nombre producto)
                 new-precio))

;;RF4. Almacenar todos los productos en una lista de favoritos, es decir, una lista contenedora de productos.

;; Dom: reciba N productos  (mis productos favoritos)
;; Rec: Una lista que contenga estos productos (lista que contiene mis productos favoritos)

;; Operador dot .
;; Constructor de listas
;; Crear listas de un largo dinamico
;; (define (constructor-listas . misargumentos) misargumentos)
;; Dom: Null | Producto
;; ListaFavoritos = Null | Producto X ListaFavoritos
(define (crear-lista-favoritos . args) args)

;;RF5. Obtener el nombre de todos los productos de la lista contenedora (lista de favoritos) de producto.

;; get-all-nombres productos-favoritos
;; High Order Functions: Funciones que reciben funciones
;; 1. Map
;; Input: Fn X (List a b c d)
;; Output: (List Fn*a Fn*b Fn*c Fn*d)
;; (map fn lst)

;; Map -> fn (x + 1) X (list 1 2 3)
;; Output: (list 2 3 4)

;; Map -> fn (x * 5) X (list 1 2 3 4)
;; Output: (list 5 10 15 20)

;; Map -> fn (get-nombre) X (list producto1 producto2 producto3)
;; Output -> ("xbox" "manzana" "manzana")

;; (map (lambda (x) (+ x 1)) (list 1 2 3 4))
;; (lambda (x) (+ x 1)) -> función anónima, función que no tiene nombre
;; (map (lambda (x) (* x 1)) (list 1 2 3 4))

(define (get-all-nombres productos)
  (map (lambda (x) (get-nombre x)) productos))

(define (get-all-precios productos)
  (map (lambda (producto) (get-precio producto)) productos))


;;RF6. De la lista contenedora obtener solo los productos cuyo precio sea mayor a 10.

;(p10 p20 p30 p40 p50 p0): FILTRAR -> SELECCIONAR ITEMS EN BASE A CIERTO CRITERIO
; (fn  (p10 p20 p30 p40 p50 p0)) = (p20 p30 p40 p50)

(define (get-producto-precio-mayor-10 productos)
  (filter (lambda (x) (> (get-precio x) 10)) productos))

;; (lambda (x) (> (get-precio x) 10))  : criterio de selección: PREDICADO -> retorno es un boolean True or False

;;RF7. De la lista contenedora obtener la suma de todos los precios de los productos.

;; Si quiero obtener la suma de todos los precios de los productos
;; PASO 1. OBTENER TODOS LOS PRECIOS:
;; Input: '(("electrico" "xbox" 20) ("fruta" "manzana" 10) ("fruta" "manzana" 100))
;; Paso 1: Obtener todos los precios
;; (map (lambda (x) (get-precio x) productos)) -> (list 20 10 100)
;; Paso 2: aplicar apply/reducer, hay que reducir una lista a un solo valor en base a una función
;; (apply + (list 20 10 100))

;; High Order Function: apply
;; reducer -> javascript

(define (get-suma-precios productos)
  (apply + (get-all-precios productos)))

;; (apply + '(get-all-precios ("electrico" "xbox" 20) ("fruta" "manzana" 10) ("fruta" "manzana" 100)))
;; (apply + (20 10 100))
;; 130


;; Script

;; Aca definimos constantes
(define p1 (make-producto "electrico" "xbox" 20))
p1
(get-nombre p1)
(get-precio p1)

(define p2 (make-producto "fruta" "manzana" 10))
p2
(get-nombre p2)
(get-precio p2)

(define p3 (set-precio p2 100))
p3

(define mis-favoritos (crear-lista-favoritos p1 p2 p3))
mis-favoritos

(get-all-nombres mis-favoritos)
(get-all-precios mis-favoritos)
(get-producto-precio-mayor-10 mis-favoritos)
(get-suma-precios mis-favoritos)

(get-suma-precios (get-producto-precio-mayor-10 mis-favoritos))

