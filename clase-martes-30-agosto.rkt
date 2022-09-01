#lang racket

; Ejemplo: (sumatoria-tail 10 0)
(define (sumatoria-tail x)
  (define sumatoria-interna
    (lambda (x acc)
      (cond
        [(zero? x) acc] ; for(i=0;condición parada)
        [(sumatoria-interna (- x 1) (+ x acc))])))
  (sumatoria-interna x 0))

(sumatoria-tail 10)

; Ejemplo: (sumatoria-tail-envoltorio 10)
;(define sumatoria-tail-envoltorio
; (lambda (x)
;   (sumatoria-tail x 0)))
