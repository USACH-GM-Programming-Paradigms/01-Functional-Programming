#lang racket

(require math)

(define initialCard
  (lambda (i set)
    (if (= i 0)
        set
        (initialCard (- i 1) (cons i set)))))

(define nextNCards
  (lambda (j n set)
    (if (> j n)
        set
        (nextNCards (+ j 1) n (cons (nextCard 1 j n (list 1)) set)))))


(define nextCard
  (lambda (k j n card)
    (if (> k n)
        card
        (nextCard (+ k 1) j n (cons (+ (* n j) k 1) card))
        )
    )
  )

(define nextN2Cards
  (lambda (i n set)
    (if (> i n)
        set
        (nextN2Cards (+ i 1) n (nextN2CardsAux1 1 i n (list (+ i 1)) set)))))

(define nextN2CardsAux1
  (lambda (j i n card set)
    (if (> j n)
        set
        (nextN2CardsAux1 (+ j 1) i n card (cons (nextN2CardsAux2 1 i j n card) set)))))

(define nextN2CardsAux2
  (lambda (k i j n card)
    (if (> k n)
        card
        (let ([newElem (+ n 2 (* n (- k 1)) (remainder (+ (* (- i 1) (- k 1)) j -1) n))])
          (nextN2CardsAux2 (+ k 1) i j n (cons newElem card))))))

(define requiredElements (lambda (numE) (+ (expt (- numE 1) 2) (- numE 1) 1)))

(define replace
  (lambda (elements i cards)
    (if (null? elements)
        cards
        (replace (cdr elements) (+ i 1) (map (lambda (c) (map (lambda (e) (if (equal? e i) (car elements) e)) c)) cards)))))

(define dobbleCriteria?
  (lambda (cards1 ne)
    (define dobbleCriteriaAux?
      (lambda (cards1 cards2 ne)
        (if (null? cards1)
            #t
            (let ([currentCard (car cards1)])
              (and (cardDobbleCriteria? currentCard (remove currentCard cards2) ne) (dobbleCriteriaAux? (cdr cards1) cards2 ne))))))

    (dobbleCriteriaAux? cards1 cards1 ne)))

;determina si una carta c cumple parcialmente o de manera completa con el criterio del juego dobble que indica
;Esto es, que un simbolo solo puede tener una ocurrencia cómo máximo con otras cartas.
(define cardDobbleCriteria?
  (lambda (c cards ne)
    (let ([singleMatches (length (filter (lambda (e) (= e 1)) (countMatches c cards)))]
          ;[otherMatches3 (countMatches c cards)]
          ;[otherMatches2 (filter (lambda (e) (> e 1)) (countMatches c cards))]
          [otherMatches (length (filter (lambda (e) (> e 1)) (countMatches c cards)))]
          [lengthCards (length cards)])
      (and (not (> otherMatches 0))
           (or  (>= lengthCards ne)   ; (<= singleMatches ne))
                (= singleMatches lengthCards))))))

;permite determinar la cantidad de elementos que coinciden dentro de una carta.
(define countMatches
  (lambda (nc Cs)
    (map (lambda (c) (- (length nc) (length c))) (map (lambda (c) (set-subtract nc c)) Cs))))



(define cardsSet
  (lambda (elements numE maxC)
    (let ([lengthElements (length elements)]
          [reqElems (requiredElements numE)])
      (if (and (> numE 1)
               (or (prime? (- numE 1)) (= numE 2))
               (or (= lengthElements reqElems) (= lengthElements 0)
                   (or (<= maxC lengthElements)) (= lengthElements 0))
               (not (> maxC reqElems)))
          (if (null? elements)
              (list-tail (nextN2Cards 1 (- numE 1) (nextNCards 1 (- numE 1) (list (initialCard numE null)))) (- reqElems maxC))
              (list-tail (replace elements 1 (nextN2Cards 1 (- numE 1) (nextNCards 1 (- numE 1) (list (initialCard numE null))))) (- lengthElements maxC)))
          null))))


(define emptyCard? null?)
(define currentElement car)
(define nextElements cdr)

(define emptyCards? null?)
(define currentCard car)
(define nextCards cdr)

(define card->string
  (lambda (card)
    (define card->stringAux
      (lambda (card Sout)
        (if (emptyCard? card)
            Sout
            (card->stringAux (nextElements card) (string-append (number->string (currentElement card)) " - " Sout)))))
    (card->stringAux card "")))

(define cardsSet->string
  (lambda (cards)
    (define cardsSet->stringAux
      (lambda (cards i Sout)
        (if (emptyCards? cards)
            Sout
            (cardsSet->stringAux (nextCards cards) (+ i 1) (string-append Sout "C" (number->string i) ": " (card->string (currentCard cards)) "\n")))))
    (cardsSet->stringAux cards 1 "")))


(display (cardsSet->string (cardsSet null 4 13)))
(display (cardsSet->string (cardsSet null 8 57)))
(display (cardsSet->string (cardsSet null 3 7)))