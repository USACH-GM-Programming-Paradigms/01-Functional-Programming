#lang racket

; Scheme

;; Documentación a seguir en el código

; Cada función debe tener arriba de su nombre, comentado lo siguiente:
; Descripción:
; Dom:
; Rec:
; Tipo de recursión:
; Ejemplo de uso:

;; 1. Hola Mundo

; Here's the familiar "hello world", written in Scheme: 
(display "Hello world!\n")

; This prints "Hello world!" to the screen. (The "\n" represents a "newline", like if you pressed enter after typing some text in a word processor.) 

;; 2. Tipos de datos

; Unlike in some other languages, math expressions like + and - are prefix functions just like any other function, and so they go first:

(+ 1 2)         ; => 3
(/ 10 2)        ; => 5
(/ 2 3)         ; => 2/3 

; Esto es porque en Lisp/Scheme todos los símbolos son funciones. Es decir, las operaciones (+, -, *, etc) son funciones que reciben argumentos.
; e.g: (funcion arg1 arg2) => (simbolo arg1 arg2 argn) => (+ arg1 arg2 argn)

; Most of these can accept multiple arguments: 
(+ 1 8 10)   ; equivalent to "1 + 8 + 10" in infix notation
#t                             ; boolean representing "true"
#f                             ; boolean representing "false"
"Pangalactic Gargleblaster"    ; string (text)
'foo                           ; symbol
'(1 2 3)                       ; a list (of numbers, in this case)
(lambda (x) (* x 2))           ; procedure (we'll come back to this)
'(lambda (x) (* x 2))          ; a list of lists, symbols, and numbers

; Procedures can also be nested, and we can use the "substitution method" to see how they simplify: 

(* (- 8 (/ 30 5)) 21)   ; beginning expression
(* (- 8 6) 21)          ; simplify: (/ 30 5) => 6
(* 2 21)                ; simplify: (- 8 6)  => 2
42                      ; simplify: (* 2 21) => 42

;; Tipos de datos
42          ; integer
98.6        ; floating point
2/3         ; fractions, or "rational" numbers
-42         ; these can all also be negative

#t                             ; boolean representing "true"
#f                             ; boolean representing "false"
"Star Wars 99"                 ; string (text)
'foo                           ; symbol
'(1 2 3)                       ; a list (of numbers, in this case)
(lambda (x) (* x 2))           ; procedure (we'll come back to this)
'(lambda (x) (* x 2))          ; a list of lists, symbols, and numbers



;; Elementos básicos del lenguaje

(define name "Linus Torvald")
(string-append "Hello " name "!")

; However, if what follows define is wrapped in parentheses, Scheme interprets this as a procedure definition: 

(define (greet name)
  (string-append "Hello " name "!"))

(greet "Samantha")

; Note that Scheme has implicit return.
; By being the last expression in the procedure, the result of the string-append is automatically returned to its caller.

; This second syntax for define is actually just syntactic sugar.
; These two definitions of greet are exactly the same:

;(define (greet name)
;  (string-append "Hello " name "!"))

;(define greet
;  (lambda (name)
;    (string-append "Hello " name "!")))

; lambda is the name for an "anonymous procedure" (ie, no name provided).
; While we have given this the name greet, the procedure would be usable without it: 

;;REPL> ((lambda (name)
;;         (string-append "Hello " name "!"))
;;       "Horace")
;;; => "Hello Horace!"

;; Condicionales y Predicados

;; Predicados

(string? "apple")
; => #t
(string? 128)
; => #f
(string? 'apple)
; => #f


;;; Definición de función

;;; if-else

;;; cond 

;; Pairs y Listas
;
;;; Pair

;;; Listas

;;;; car (primer elemento) y cdr (resto de los elementos)

;;; dot notation

; Ejemplo: (append (list 1 2 3))
; Ejemplo: (append (list 1 2 3) (list 4 5 6))
; Ejecución: '((1 2 3) (4 5 6))
(define (append . args) display (cdr args))

;;

; dot-notation
(define (dot-notation . args)
  (display (car args))
  (newline)
  (display (cdr args)))

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
