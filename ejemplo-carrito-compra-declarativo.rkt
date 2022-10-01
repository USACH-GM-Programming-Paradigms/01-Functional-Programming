#lang racket

;; Tda producto
(define (producto id nombre precio descuento stock id-tienda)
  (list id nombre precio descuento stock id-tienda))

(define get-precio
  (lambda (producto)
    (caddr producto)))

(define get-descuento
  (lambda (producto)
    (cadddr producto)))

(define get-precio-con-descuento
  (lambda (producto)
    (- (get-precio producto)
       (get-descuento producto))))

;; Tda carrito compra
(define (carrito usuario productos)
  (list usuario productos))

(define get-productos-de-carrito
  (lambda (carrito)
    (cadr carrito)))


;; Ej: (get-precio-total-productos (list p1 p2))
(define get-precio-total-productos
  (lambda (productos)
    (apply +
           (map get-precio productos))))

(define get-precio-con-descuento-productos
  (lambda (productos)
    (apply +
           (map get-precio-con-descuento productos))))

(define get-precio-total-carrito
  (lambda (mi-carrito)
    (get-precio-total-productos
     (get-productos-de-carrito mi-carrito))))

(define get-precio-descuento-carrito
  (lambda (mi-carrito)
    (get-precio-con-descuento-productos
     (get-productos-de-carrito mi-carrito))))

;; Filter
(define get-productos-precio-menor
  (lambda (productos precio)
    (filter (lambda (producto)
              (< (get-precio producto) precio))
            productos)))

;; Currificado
(define is-precio-menor?
  (lambda (producto precio)
    (cond [ (< (get-precio
                producto)
               precio) #t]
          [else #f])))
          


;; Script pruebas

(define p1 (producto 0 "mesa" 100 10 3 1))
(define p2 (producto 1 "silla" 50 5 2 1))
(define p3 (producto 2 "gameboy" 60 5 2 1))
(define c1 (carrito "gonzalo" (list p1 p2 p3)))

p1
p2
c1

(get-precio p1)
(get-precio-total-carrito c1)
(get-precio-descuento-carrito c1)
(get-productos-precio-menor (list p1 p2 p3) 60)
