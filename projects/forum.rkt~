#lang racket
;Stack Lista de 5 elementos
;(IDUserActivo users questions answers rewards)

;constructor
;-1 indica que no hay una sesión activa
(define emptyStack (list -1 (list 0) (list 0) (list 0) (list 0)))
(define stack list)
                    
;selectores
(define activeUserID car)
(define users cadr)
(define questions caddr)
(define answers cadddr)
(define rewards (lambda (S) (car (cddddr S))))

;modificadores
(define addNewUser
  (lambda (s newUser)
    (stack (activeUserID s) (addUser (users s) newUser) (questions s) (answers s) (rewards s))))

;TDA Question
;(qID uID date question . labels)
;constructor
(define question list)

;selectores
(define qID car)
(define uIDQ cadr)
(define dateQ caddr)
(define questionText cadddr)
(define labelsQ cddddr)

;TDA Questions
;LastQID X Question List
;selectores
(define lastQID car)
(define questionsL cdr)

;modificadores
(define addQuestion (lambda (qL f q e)
                      (let ([nQ (question (+ (lastQID qL) 1) f q e)])
                        (cons (qID nQ) (cons nQ (cdr qL))))))



;TDA Answer
;(aID uID qID date answer . labels)
;selectores
(define aID car)
(define uIDA cadr)
(define qIDA caddr)
(define dateA cadddr)
(define answer (lambda (A) (car (cddddr A))))
(define labelsA (lambda (A) (cdr (cddddr A))))

;TDA Answers
;LastAID X Answer List
;selectores
(define lastAID car)
(define answersL cdr)

;TDA Reward


;TDA Rewards
;LastRID X Reward List

;TDA User
;(uID username pass)
;constructor
(define user (lambda (uID nick pass) (list uID nick pass)))

;selectores
(define uID car)
(define username cadr)
(define password  caddr)

;TDA Users
;LastUID X User List
;selectores
(define lastUID car)
(define usersL cdr)

;modificadores
(define addUser
  (lambda (uL nick pass)
    (let ([nU (user (+ (lastUID uL) 1) nick pass)])
      (cons (uID nU) (cons nU (cdr uL))))))


(define register
  (lambda (s nick pass)
    (if (null? (filter (lambda (U) (eqv? (username U) nick)) (usersL (users s))))
        (stack (activeUserID s) (addUser (users s) nick pass) (questions s) (answers s) (rewards s))
        s)))


;ejemplo de uso
(define SO (register (register emptyStack "user" "pass") "user2" "pass"))


;login
(define login (lambda (s nick pass operation)
                (let ([U (filter (lambda (U) (and (eqv? (username U) nick) (eqv? (password U) pass))) (usersL (users s)))])
                  (if (null? U)
                      operation
                      (operation (stack (uID (car U)) (users s) (questions s) (answers s) (rewards s))))
                  )))
                    

;ask
(define ask (lambda (s)
              (lambda (f)
                (lambda (q . e)
                  (if (> (activeUserID s) 0) ;verifica que hay una sesión activa de usuario autenticado mediante login
                      (stack -1 (users s) (addQuestion (questions s) f q e) (answers s) (rewards s))   ;añade la pregunta y "cierra" la sesión
                      s
                      )))))


;ejemplo
(login SO "user" "pass" ask) ;login exitoso y listo para preguntar
(login SO "user2" "pass" ask) ;login exitoso y listo para preguntar
(login SO "user3" "pass" ask) ;login fallido, solo retorna la operación

;ejemplo con pregunta realizada
(((login SO "user" "pass" ask) "abril") "mi pregunta" "et1" "et2" "et3")

;ejemplo de pregunta sin login. Esto es, sin autenticación de usuario, por lo cual login retorna el mismo stack sin registrar la pregunta realizada
(((ask SO) "Octubre") "MI PREGUNTA" "e1" "e2")