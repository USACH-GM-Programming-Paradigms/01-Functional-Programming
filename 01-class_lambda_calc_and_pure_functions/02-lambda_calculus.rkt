#lang racket

;; Passing args as Lambda expression
;; Example: (triangule-area-v1 34 24)
(define triangule-area-v1
  (lambda (b h)
    (/ (* b h) 2)))

;; Passing args as part of the signature of the function
;; Example: (triangule-area-v2 34 24)
(define (triangule-area-v2 b h)
  (/ (* b h) 2))

;; BOTH APPROACHES ARE THE SAME

(triangule-area-v1 34 24)
(triangule-area-v2 34 24)
