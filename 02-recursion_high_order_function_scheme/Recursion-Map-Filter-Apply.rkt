#lang racket

;; Count element in a list

;; Dom: List
;; Rec: number
;; Tipo de recursión: natural
(define (length-natural lst)
  (if (null? lst)
      0
      (+ 1 (length-natural (cdr lst)))))

(length-natural (list 1 2 3))

;; Dom: List
;; Rec: number
;; Tipo de recursión: tail

(define (length-tail lst)
  (define (length-helper lst acc)
    (if (null? lst)
        acc
        (length-helper (cdr lst) (+ 1 acc))))
  (length-helper lst 0))

(length-tail (list 1 2 3))


;; Sum elements in a list

;; sumar elementos de una lista es lo mismo que (apply + (list 1 2 3))

;; Dom: List
;; Rec: number
;; Tipo de recursión: natural
(define (sum-natural lst)
  (if (null? lst)
      0
      (+ (car lst) (sum-natural (cdr lst)))))

(sum-natural (list 10 20 30))

;; Dom: List
;; Rec: number
;; Tipo de recursión: tail
(define (sum-tail lst)
  (define (sum-helper lst acc)
    (if (null? lst)
        acc
        (sum-helper (cdr lst) (+ (car lst) acc))))
  (sum-helper lst 0))

(sum-tail (list 10 20 30))

;; Map

;; Dom: fn X List
;; Rec: List
;; Tipo de recursión: natural
(define (map-natural fn lst)
  (cond [(null? lst) lst]
        [else (cons (fn (car lst))
                    (map-natural fn (cdr lst)))]))

(map-natural (lambda (x) (+ x 1)) (list 1 2 3))

;; Dom: fn X List
;; Rec: List
;; Tipo de recursión: tail
(define (map-rec-tail fn lst)
  (define (map-tail fn lst acc)
    (cond [(null? lst) (reverse acc)]  ;; acc entrega la lista al reves, hay que aplicar reverse
          [else (map-tail fn (cdr lst)
                          (cons (fn (car lst)) acc))]))
  (map-tail fn lst null))

(map-rec-tail (lambda (x) (+ x 1)) (list 1 2 3))

;; Filter

;; Dom: fn X List
;; Rec: List
;; Tipo de recursión: natural
(define (filter-natural pred? lst)
  (cond [(null? lst) lst]
        [(pred? (car lst)) (cons (car lst)
                                 (filter-natural pred? (cdr lst)))]
        [else (filter-natural pred? (cdr lst))]))

(filter-natural even? (list 1 2 3 4))


;; Dom: fn X List
;; Rec: List
;; Tipo de recursión: tail
(define (filter-rec-tail pred? lst)
  (define (filter-tail pred? lst acc)
    (cond [(null? lst) (reverse acc)]
          [(pred? (car lst)) (filter-tail pred? (cdr lst) (cons (car lst) acc))]
          [else (filter-tail pred? (cdr lst) acc)]))
  (filter-tail pred? lst null))

(filter-rec-tail even? (list 1 2 3 4))

;; Apply

;; Dom: fn X List
;; Rec: List
;; Tipo de recursión: natural
(define (apply-natural fn lst)
  (cond [(null? lst) null]
        [(cond [(null? (cdr lst)) (car lst)]
               [else (fn (car lst) (apply-natural fn (cdr lst)))])]))

(apply-natural + (list 1 2 3))

;; Dom: fn X List
;; Rec: List
;; Tipo de recursión: tail
(define (apply-tail fn lst)
  (define (apply-helper fn lst acc)
    (if (null? lst)
        acc
        (apply-helper fn (cdr lst) (fn (car lst) acc))))
  (apply-helper fn lst 0))

(apply-tail + (list 10 20 30))


