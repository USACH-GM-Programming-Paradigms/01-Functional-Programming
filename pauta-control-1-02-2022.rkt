#lang racket

; Solución Control 1 02 2022

;; Pregunta 1

;;; Dada la siguiente función:

(define fn (lambda (list)
             (if (null? list)
                 0
                 (+ 1 (fn (cdr list))))))

;; Ejemplo de uso: (no aparece en el enunciado)
(fn (list 1 2 3 4))

;; 1a
;;;  ¿Qué realiza el código previamente mostrado?
;;; Solución:

;;; calcula largo de una lista

;; 1b
;;; ¿Qué tipo de recursión se aprecia en el código?
;;; Solución:
;;; natural

;; 1c
;;; Señale en el código anterior aquellos elementos distintivos que lo
;;; llevaron a la clasificación del tipo de recursividad que señaló en b?
;;; Solución:
;;; estado pendiente (+ 1 .....)

;; 1d
;;; Respetando el encabezado de la función, esto es, su nombre, los argumentos de entrada y el orden de estos;
;;; implementar una alternativa usando otro tipo de recursividad distinta a la señalada en la pregunta b)
;;; y además señale que elementos distintivos se relacionan con la recursión implementada.

;;; Solución:
;;; Solo para efectos de Dr racket, le cambie el nombre a fn-2, pero deberia llamarse fn
(define fn-2 (lambda (l)
               (define fnAux (lambda (l acum)
                               (if (null? l) acum
                                   (fnAux (cdr l) (+ acum 1)))))
               (fnAux l 0)))


;; Esto corresponde a una recursión tipo cola (Tail Recursion) y los elementos distintivos corresponden a la siguiente linea:
;; (fnAux (cdr l) (+ acum 1)))))
;; Esto debido a que va acumulando el resultado en los argumentos de la función fnAux

;;; Ejemplo
(fn-2 (list 1 2 3 4))

;; 1d
;;; Documente la implementación de la función de referencia f y
;;; la implementada en el item (d) indicando Dominio, Recorrido, Descripción y Tipo de recursividad empleada.
;;; Solución:

;;; en ambos casos
;;; dom: lista
;;; rec: int

;;; recursión función original: natural
;;; recursión función d: de cola


;; Pregunta 2

;; 2a
;;; Implementar una función que permita reducir una lista a un único valor a través del uso de una operación matemática.
;;; La función se llamará reducir y tendrá el siguiente encabezado (reducir operación lista). A modo de ejemplo:
;;; (reducir + (list 1 2 3 4 5 6)) => 21
;;; (reducir * (list 1 2 3 4 5 6)) => 720

;;; Solución:


; Descripción: reducir una lista usando una función de operación
; Dom: función X lista
; Rec: number
; Tipo de recursión: Natural
(define reducir (lambda (f l)
                  (if (null? l) null
                      (if (null? (cdr l)) ; funciona para listas de al menos 1 elemento
                          (car l)
                          (f (car l) (reducir f (cdr l)))))))

;; da como resultado: 21
(reducir + (list 1 2 3 4 5 6))

;; da como resultado: 720
(reducir * (list 1 2 3 4 5 6))


;; 2b
;;; Documente su implementación indicando Dominio, Recorrido, Descripción y Tipo de recursividad empleada.

;;; Solución

;dom: funcionAritmética X lista
;recorrido: numero
;recursión: natural

;; 2c

;;; Realizar una implementación funcional - declarativa de la función:
;;; (filtrar-mapear-reducir filtro funcionMapeo funciónReducción lista),
;;; la que permite aplicar un filtro para seleccionar elementos específicos dentro de una lista,
;;; para luego aplicar la funciónMapeo a cada elemento de la lista y finalmente reducir la lista a partir de la funciónReducción
;;; A modo de ejemplo:
	
;;; (filtrar-mapear-reducir even? (lambda (e) (+ e 1)) + (list 1 2 3 4 5 6)) => 15

;;; Que filtra la lista para obtener solo los pares (even?), a continuación suma 1 cada elemento de la lista y finalmente suma todos los elementos, lo que da como resultado 15.

;;; Solución:
(define (filtrar-mapear-reducir fnFilter fnMap fnReducer lst)
  (apply fnReducer (map fnMap (filter fnFilter lst))))

;;; Ejemplo:
(filtrar-mapear-reducir even? (lambda (e) (+ e 1)) + (list 1 2 3 4 5 6))

;; 2d

;;; A partir del ejemplo anterior donde se suma 1 a cada elemento de la lista,
;;; realicé una implementación currificada de la función sumaN que permita sumar N a los elementos de la lista.

;;; Solución:
(define sumarN
  (lambda (n)
    (lambda (x)
      (+ x n))))

;;; Ejemplo de uso:
;;; ((sumarN x) 3)  ; x se le suma n=3 de forma currificada

((sumarN 2) 3)

;; Si se aplica a toda una lista, queda:
(map (sumarN 5) (list 1 2 3 4))

;; 2e

;;; Ilustre a través de un ejemplo el uso de la función sumaN junto a la función filtrar-mapear-reducir
;;; para sumar 5 a los elementos de la lista luego de ser filtrados.

;;; Respuesta:
;;; Un ejemplo es del tipo:
;;; (filtrar-mapear-reducir fnFilter (sumarN valorN) fnReducer lst)

(filtrar-mapear-reducir even? (sumarN 5) + (list 1 2 3 4 5 6))

;; La traza de esto queda:
;; (filtrar-mapear-reducir even? (sumarN 5) + (list 1 2 3 4 5 6))
;; (apply fnReducer (map fnMap (filter fnFilter lst))))
;; (apply + (map (sumarN 5) (filter even? (list 1 2 3 4 5 6) ))))
;; (apply + (map (sumarN 5) (list 2 4 6) ))))
;; (apply + (list 7 9 11) ))))
;; 27