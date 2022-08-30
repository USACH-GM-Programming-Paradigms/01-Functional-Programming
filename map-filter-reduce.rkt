#lang racket

; Map
; (map (funcion) (list))
; Dom: function X list
; Rec: list
(map (lambda (x) (* x 2)) (list 1 2 3 4))

; Filter
; (filter (funcion-predicado) (list))
; Dom: function X list
; Rec: list
(filter (lambda (x) (> x 2)) (list 1 2 3 4))

; Apply/reduce
; (apply operacion ; resultado: '(3 4)(list))
; Dom: function X list
; Rec: list
(apply + (list 1 2 3 4))