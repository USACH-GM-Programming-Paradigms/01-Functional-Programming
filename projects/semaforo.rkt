#lang racket

(define (semaforo luz)  ;;Sirve para construir el objeto
  (define (procMen p) ;; p equivale a la luz recibida
          
    (cond
      ( (eq? p 'luz) luz ) ;;(semaforo 'verde) , la luz queda en verde
                  
      ( (eq? p 'cambiar ) ;;cambiar , cambia la luz
        ;;Cambiar el valor de la luz
        (cond 
          ( (eq? luz 'rojo) (set! luz 'verde) ) 
          ( (eq? luz 'amarillo) (set! luz 'rojo) )
          ( (eq? luz 'verde) (set! luz 'amarillo) )

          (else (error "luz no existe en semaforo") )
          ) ;fin cond
                        
        luz) ;fin (eq? p 'cambiar )
                  
      (else 
       (error "mensaje no procesable")
       )
      );fin cond
          
    ) ;fin (define (procMen p)
  
  procMen ;recursivo
  
  );Fin define