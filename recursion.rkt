#lang racket


; Caso de estudio:
;  Sumar todos los números de una lista de números
; Dominio: list number
; Rec: number
; Ejemplo:
; > (sumar-numeros (list 1 2 3 4))
; > 10

; Sumatoria de lista de números
; Recursión: Natural
; Ejemplo:
; > (lst-sum-natural (list 1 2 3 4))
; 10
(define (lst-sum-natural lst)
  (if [null? lst] 0
      [+ (car lst)
         (lst-sum-natural (cdr lst))
         ]))

; El equivalente de la función previa es:
; (+ 1 (+ 2 (+ 3 (+ 4 0))))

; Sumatoria de lista de números
; Recursión: Tail Recursion
; Ejemplo:
; > (lst-sum-natural (list 1 2 3 4))
; 10
; a tail-recursive list summing procedure
(define (do-lst-sum-tail lst acc)
  (cond [(null? lst) acc]
        [else
         (do-lst-sum-tail (cdr lst)
                          (+ acc (car lst)))
         ]))


; a friendly wrapper that supplies an initial running sum of 0
; (lst-sum-tail (list 1 2 3 4))
(define (lst-sum-tail lst)
  (do-lst-sum-tail lst 0))

; Escrito de forma más limpia
(define (lst-sum-tail-clean lst acc)
  (cond [(null? lst) acc]
        [else
         (do-lst-sum-tail (cdr lst)
                          (+ acc (car lst)))
         ]))

; Caso de estudio:
;  Obtener el largo total de una lista
; Dominio: list number
; Rec: number
; Ejemplo:
; > (largo (list 1 2 3 4))
; > 4

; Recursión: Natural
; (length (list 1 2 3 4))
(define (len-natural lst)
  (if [null? lst] 0
      [+ 1 (len-natural (cdr lst))]))

; Recursión: Tail Recursion
; (len-tail (list 1 2 3 4))
(define (len-tail lst)
  (define (do-len-tail lst acc)
    (if (null? lst) acc
        (do-len-tail (cdr lst)
                     (+ 1 acc))))
  (do-len-tail lst 0))

;; Caso de estudio: multiplicar los números de una lista



(define (lst-prod-natural lst)
  (if [null? lst] 1
      [* (car lst)
         (lst-sum-natural (cdr lst))
         ]))

(define (reduce fn base-value lis)
  (if (null? lis)
      base-value
      (fn (car lis)
          (reduce fn base-value (cdr lis)))))

(reduce * 1 (list 1 2 3 4))

(define (append list1 list2)
   (reduce cons list2 list1))

(append (list 1 2 3 4) (list 5 6 7 8))

(define (list-copy lis)
   (reduce cons '() lis))

(define (make-reducer fn base-value)
  (lambda (lis)
    (reduce fn base-value lis)))

((make-reducer + 0) '(1 2 3 4))

((make-reducer * 1) '(1 2 3 4))

;(define (suma . args)
;  (reduce + 0 args))


;(suma + 0 (list 1 2 3 4))

(define (make-reducer2 fn base-value)
  (define (reduce lis)
    (if (null? lis)
        base-value
        (fn (car lis)
            (reduce (cdr lis)))))
  reduce)  ;return new closure of local procedure