#lang racket

; Pares

; (myfunction-lambda 2)
(define myfunction-lambda
  (λ (x)
    (display x)))

(define (myfunction arg)
  (list arg))

(define (myfunction2 arg . args)
  (list (car args)))

(define (move-to-next-elements lst) (cdr lst))

(define (get-current-element lst) (car lst))

(define (get-next-element lst)
  (car (cdr lst)))

;; Tail Recursion
; (sum-elements (list 1 2 3 4 5))
(define (sum-elements lst)
  (define (do-sum lst acc)
    (cond
      [(null? lst) acc]
      [else (do-sum (cdr lst)
                    (+ (car lst) acc))]
      ))
  (do-sum lst 0))

;; Natural Recursion
; (sum (list 1 2 3 4 5))

;; using cond
(define (sum lst)
  (cond
    [(null? lst) 0]
    [else ( + (car lst)
              (sum (cdr lst))
              )
          ]))

;; using if
(define (sum-v2 lst)
  (if
   (null? lst) 0
   (+ (car lst) (sum-v2 (cdr lst)))
   ))

; using apply
; (sum-apply (list 1 2 3 4 5))
(define (sum-apply lst) (apply + lst))

; Ejemplo: (merge-two-lists (list 1 2 3) (list 4 5 6))
; Ejecución: '(1 2 3 4 5 6)
(define (merge-two-lists lst1 lst2)
  (if (null? lst1) lst2
      (cons (car lst1)
            (merge-two-lists (cdr lst1) lst2))))

; Merge intercalado
; Ejemplo: (merge-two-lst (list 1 2 3) (list 4 5 6))
; Ejecución: '(1 4 2 5 3 6)
(define (merge-two-lst lst1 lst2)
  (cond [(null? lst1) lst2]    ; if the first list is empty, return the second
        [(null? lst2) lst1]    ; if the second list is empty, return the first
        [else (cons (car lst1) ; otherwise `cons` the first element of the first list
                    (merge-two-lst lst2 (cdr lst1)))])) ; and interleave the lists

; Ejemplo: (append (list 1 2 3))
; Ejemplo: (append (list 1 2 3) (list 4 5 6))
; Ejecución: '((1 2 3) (4 5 6))
(define (append . args) args)

; Ejemplo: (print-dot-notation (list 1 2 3) (list 4 5 6) (list 7 8 9))
(define (print-dot-notation arg . args)
  (display arg)
  (newline)
  (display (car arg))
  (newline)
  (display (cdr arg))
  (newline)
  (display args)
  (newline)
  (display (car args))
  (newline)
  (display (cdr args)))

; Ejemplo: (print-dot-notation-v2 (list 1 2 3) (list 4 5 6) (list 7 8 9))
(define (print-dot-notation-v2 . args)
  (display args)
  (newline)
  (display (car args))
  (newline)
  (display (cdr args))
  (newline)
  (display (car (cdr args))))

;; Merge Natural Recursion
;; (merge 1 2 3 4 5)
;; '(1 2 3 4 5)
;; (merge (list 1 2 3) (list 4 5 6))
(define (merge . args)
  (cond [(null? (cdr args)) (car args)]
        [else (cons (car args) (merge (cdr args)))]))