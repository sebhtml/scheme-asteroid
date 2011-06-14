;Sébastien Boisvert <Sebastien.Boisvert@USherbrooke.ca>  
;Marcel Tawé <Marcel.Tawe@USherbrooke.ca>         
;Pier-Luc Desgagné <Pier-Luc.Desgagne@USherbrooke.ca>  
;Gaoussou Traoré <Gaoussou.Traore@USherbrooke.ca>
;
;tp4 
;Construire un jeu
;ift359 Programmation fonctionnelle
;Été 2007
;Prof.:
;Chargé de correction: 
;
;Jeu d'avion
;
;Département d'informatique
;Faculté des sciences
;Université de Sherbrooke



; @author Sébastien
(classe GeometrieDeBase
        ((privé x)
         (privé y)) 
        (
         (publique contient (self)
                   #f)
         
         (publique GeometrieDeBase (self)
                   #f) 
         
         
         (publique distance (self x1 y1 x2 y2)
                   (sqrt 
                    (+ (expt (- x1 x2) 2)
                       (expt (- y1 y2) 2))))
         
         (publique angle (self x1 y1 x2 y2)
                   (let* ((dx (- x2 x1))
                          (dy (- y1 y2)))
                   ; (print (format "~s ~s" dx dy))(newline)
                     (cond ((and (= dx 0) (< dy 0)) (/ pi 2))
                           ((and (= dx 0) (> dy 0)) (/ (* 3 pi) 2))
                           ((and (< dx 0) (= dy 0)) pi)
                           ((and (> dx 0) (= dy 0)) 0)
                           (else (let ((angle (atan (/ dy dx))))
                                   (cond ((and (> dx 0) (> dy 0)) angle)
                                         ((and (> dx 0) (< dy 0)) angle)
                                         ((and (< dx 0) (> dy 0)) (if (< angle 0) (+ angle pi) angle))
                                         ((and (< dx 0) (< dy 0)) (if (< angle 0) (+ angle (/ (* 3 pi) 2)) (+ angle pi)))
                                         (else angle)))))))
         
         (publique genererPolygone (self x y r n)
                   (define (iter angle)
                     (if (> angle (* 2 pi))
                         null
                         (cons  (+ x (* r (cos angle)))
                               (cons (- y (* r (sin angle))) (iter (+ angle (/ (* 2 pi) n)))))))
                   (iter 0))
         
         (publique rotationPoint (self x1 y1 x2 y2 theta)
                   ;(print (format "~s ~s" x1 y1))(newline)
                   (let* ((epsilon (ask self 'distance x1 y1 x2 y2))
                          (alpha (ask self 'angle x1 y1 x2 y2))
                          (beta (+ theta alpha))
                          (x3 (+ x1 (* epsilon (cos beta))))
                          (y3 (- y1 (* epsilon (sin beta)))))
                     ;(print alpha)(newline)
                     (cons x3 y3))
                   )
         
         
         (publique tournerListe (self liste x y angle)
;                   (print angle)(newline)
                   (if (null? liste) null
                       (let* ((x1 (car liste))
                              (y1 (cadr liste))
                              (nouveauPoint (ask self 'rotationPoint x y x1 y1 angle))
                              (x2 (car nouveauPoint))
                              (y2 (cdr nouveauPoint)))
                         (cons x2 (cons y2
                                        (ask self 'tournerListe (cddr liste) x y angle))))))
         
         (publique collisionAvecCercle (self cercle)
                   #f)
         
         ))

