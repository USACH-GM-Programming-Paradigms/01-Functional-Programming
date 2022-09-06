#lang racket

(sort (list 90 100 2 3 5 2) <)


(define (sort-desc-by-second lst)
  (sort lst
        (lambda (x y) (> (cdr x) (cdr y)))))

(sort-desc-by-second '((1 . 1) (2 . 3) (3 . 2)))

(car (sort-desc-by-second '((1 . 1) (2 . 3) (3 . 2))))

(car (car (sort-desc-by-second '((1 . 1) (2 . 3) (3 . 2)))))
(cdr (car (sort-desc-by-second '((1 . 1) (2 . 3) (3 . 2)))))