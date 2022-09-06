#lang racket

;; Listas

;; Operaciones

;;; Reverse
;;; Da vuelta una lista

(define (my-reverse lst)
  (define (f l r)
    (if (null? l) r
        (f (cdr l) (cons (car l) r))))
  (f lst null))


;;; Append
;;; Append es agregar un elemento al final de la lista

;;;; Append usando Tail Recursion

;; Enfoque declarativo

(define (append-declarative lst e)
  (reverse (cons e (reverse lst))))

;; Recursión Natural
; en scheme append es concatenar dos listas
; aca hacemos una sobreescritura de ese método
; también se puede llamar add

(define (append lst e)
  (cond
    [(null? lst) (cons e null)]
    [else
     (cons (car lst) (append (cdr lst) e))]))

;(append (list 1 2 3) 4)

;; Tail Recursion

(define (append-tail lst e)
  (define (f l acc)
    (cond [(null? l)
           acc]
          [(null? acc)
           (f (cdr l) (cons e (car lst)))]
          ;[else
          ; (f (cdr l) (cons (car l) (cdr acc)))]
          ))
  (f lst null))

(define remove
  (lambda (lst item)
    (cond
      ((null? lst) null)
      ((equal? item (car lst)) (cdr lst))
      (else (cons (car lst) (remove (cdr lst) item))))))


;; 1 2 3 4
;; null

;; car: 1
;; cdr: 2 3 4
;; new-lst: 1 . null



;; Pertenece?
(define (member? e lst)
  (if (null? lst) #f                                
      (if (equal? e (car lst)) #t
          (member? e (cdr lst)))))
