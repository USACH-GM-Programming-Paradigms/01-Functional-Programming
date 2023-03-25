#lang racket


;; Recursion


;; Recursion Natural
;; Dejo estados pendientes que se resuelven en la condición de parada

; Ejemplo: (sumatoria-natural 10)
(define sumatoria-natural
  (lambda (n)
    (cond
      [(zero? n) 0]
      [else (+ n (sumatoria-natural (- n 1)))])))


;; Recursion de Cola (Tail Recursion=
;; Voy resolviendo estados

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