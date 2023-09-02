#lang scheme

;; TDA Producto

;; Producto = List TipoProducto (str) X Nombre (str) X Precio (str)

;; Constructor
(define (make-producto tipo-producto nombre precio)
  (list tipo-producto nombre precio))

(define (make-manzana nombre precio)
  (make-producto "fruta" nombre precio))

;; Capa selectora
(define (get-tipo-producto producto)
  (car producto))

(define (get-nombre-producto producto)
  (cadr producto))

(define (get-precio-producto producto)
  (caddr producto))


;; Capa modificadora
(define (set-precio-producto producto new-precio)
  (make-producto (get-tipo-producto producto)
                 (get-nombre-producto producto)
                 new-precio))

;; TDA Lista de Productos
;; Constructor de listas (tamaño fijo)
(define (lista-productos . productos) productos)

;; Obtener los precios de los productos
(define (get-precios-productos productos)
  (map (lambda (e) (get-precio-producto e))
       productos))

;; Filtrar solo los elementos cuyo precio sea mayor a 10
;; gt = great than
;; lt = less than
;; eq = equal than
(define (filter-productos-precio-gt-10 productos)
  (filter (lambda (e) (> (get-precio-producto e) 10))
          productos))

;; Obtener la suma del precio de todos los productos de la lista de productos
(define (calculate-suma-precios productos)
  (apply + (get-precios-productos productos)))


;; Script ejecución


(define p1 (make-manzana "manzana" 10))
p1

(define p2 (set-precio-producto p1 200))
p2

(define mis-productos (lista-productos p1 p2))
mis-productos

(get-precios-productos mis-productos)
(filter-productos-precio-gt-10 mis-productos)
(calculate-suma-precios mis-productos)