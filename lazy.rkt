#lang racket

;descripción: función para calcular n-esimo término de la sucesión de fibonacci
;dom: enteros positivos + {0}
;rec: enteros positivos + {0}
;tipo recursión: arbórea - binaria
(define fib
  (lambda (n)
    ;caso base
    (if (<= n 1) ;n entero positivo + {0}
        n ;solución conocida
        (+ (fib (- n 2)) (fib (- n 1))) ;descomposición recursiva
        )
    )
  )

;(fib 38) toma tiempo en evaluarse
(fib 38)

;evaluación perezosa de (fib 38)
;promesa vinculada a p2
(define p2 (lazy (fib 38)))

;p2 es una promesa
p2

;se puede forzar la evaluación de la promesa
;tomará tiempo en evaluarse
(force p2)

;la promesa ha sido cumplica
p2

;dado que la promesa ya se cumplió
;la próxima vez que se fuerza, el resultado se entrega de forma inmediata
(force p2)