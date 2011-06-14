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




; @author Pier-Luc
(classe  GeometriePolygone hérite GeometrieDeBase 
         ((privé points)
          (privé x)
          (privé y)
          (privé r)
          (privé cercle))
         (
          
          (publique GeometriePolygone (self x y liste_sommets)
                    
                    (define (iter points r)
                      ;  (print "-> ")(print points)(newline)
                      (if (null? points)
                          (ask self 'setSlot 'r r)
                          (let* ((c (new 'GeometrieCercle 1 23 3))
                                 (x (car points))
                                 (y (cadr points))
                                 (nouveauR (ask c 'distance x y (ask self 'getSlot 'x) (ask self 'getSlot 'y))))
                            
                            (if (> nouveauR r)
                                (iter (cddr points) nouveauR)
                                (iter (cddr points) r)))))
                    
                    (ask self 'setSlot 'points liste_sommets)
                    (ask self 'setSlot 'x x)
                    (ask self 'setSlot 'y y)
                    (iter liste_sommets 0)
                    (let ((cercle (new 'GeometrieCercle 1 2 3)))
                      (ask cercle 'GeometrieCercle x y (ask self 'getSlot 'r))
                      ;(print (ask self 'getSlot 'r))(newline)
                      (ask self 'setSlot 'cercle cercle)))
          
          ;TODO CollisionAvecPolygone (optimisation..)
          (publique collisionAvecPolygone (self poly)
                    (ask self 'collision poly))
          
          ; @author Pier-Luc
          ; verifier si le cercle contient une des aretes 
          ;du polygone (TODO ; aproximation avec un cercle)
          ;Note, dans le cond en comments, il fait contientdroite 2 fois pour chaque arete?
          (publique collisionAvecCercle (self cercle)
                    (if (ask cercle 'collisionAvecCercle
                             (ask self 'getSlot 'cercle))
                        (ask self 'collision cercle)
                        #f))
          
          ; @author Pier-Luc
          ;TODO
          ; à faire....... si nécessaire
          (publique contient (self x y)
                    #f)
          
          (publique contientDroite (self a_x a_y b_x b_y)
                    (define (iter points) 
                      ; (print points)(newline)
                      (if (= 1 (/ (length points) 2))
                          ;; le dernier point avec le premier
                          (let* ((tousLesPoints (ask self 'getSlot 'points))
                                 (x1 (car points)) 
                                 (y1 (cadr points))
                                 (x2 (car tousLesPoints))
                                 (y2 (cadr tousLesPoints))
                                 (pointCollision (ask self 'droite-Droite x1 y1 x2 y2 a_x a_y b_x b_y)))
                            (if pointCollision
                                pointCollision
                                #f))
                          ;; le premier point avec le deuxième (d'un point de vue récursif..)
                          (let* ((x1 (car points)) 
                                 (y1 (cadr points))
                                 (x2 (caddr points))
                                 (y2 (cadddr points))
                                 (pointCollision (ask self 'droite-Droite x1 y1 x2 y2 a_x a_y b_x b_y)))
                            (if pointCollision
                                pointCollision
                                (iter (cddr points))))))
                    (iter (ask self 'getSlot 'points)))
          
          ; barta générique
          ; @author Pier-Luc
          ;=====
          ;Optimiser toute les collisions dans le moteur en calculant avant si il y a une
          ;collision entre deux cercles pour chaque objet, si non, alors il y a pas de
          ;collision, si oui, il y a peut-être une collision.
          (publique collision (self cercle)
                    (define (iter points) 
                      ; (print points)(newline)
                      (if (= 1 (/ (length points) 2))
                          ;; le dernier point avec le premier
                          (let* ((tousLesPoints (ask self 'getSlot 'points))
                                 (x1 (car points)) 
                                 (y1 (cadr points))
                                 (x2 (car tousLesPoints))
                                 (y2 (cadr tousLesPoints))
                                 (pointCollision (ask cercle 'contientDroite x1 y1 x2 y2)))
                            (if pointCollision
                                pointCollision
                                #f))
                          ;; le premier point avec le deuxième (d'un point de vue récursif..)
                          (let* ((x1 (car points)) 
                                 (y1 (cadr points))
                                 (x2 (caddr points))
                                 (y2 (cadddr points))
                                 (pointCollision (ask cercle 'contientDroite x1 y1 x2 y2)))
                            (if pointCollision
                                pointCollision
                                (iter (cddr points))))))
                    (iter (ask self 'getSlot 'points)))
          
          (publique droite-Droite (x1 y1 x2 y2 a_x a_y b_x b_y)
                    (cond ((and (= (- b_x a_x) 0) (= (- x2 x1) 0)) #f)
                          ((= (- b_x a_x) 0)
                           (ask self 'droite-Droite a_x a_y b_x b_y x1 y1 x2 y2))
                          (else
                           (let* ((dx1 (- x2 x1))
                                  (dy1 (- y2 y1))
                                  (pente1 (if (= dx1 0) null (/ dy1 dx1)))
                                  (dx2 (- b_x a_x))
                                  (dy2 (- b_y a_y))
                                  (pente2 (/ dy2 dx2)))
                             (if (or (null? pente1) (< pente1 pente2))
                                 (let* ((abscisse1 (if (null? pente1) null (- y1 (* pente1 x1))))
                                        (abscisse2 (- b_y (* pente2 b_x)))
                                        (x (if (null? pente1) x1 (/ (- abscisse2 abscisse1) (- pente1 pente2))))
                                        (y (+ (* pente2 x) abscisse2))
                                        (cercle (new 'GeometrieCercle)))
                                   ; (print (format "a1 ~s b1 ~s a2 ~s b2 ~s" pente1 abscisse1 pente2 abscisse2))
                                   ;  (print (format "~s ~s" x y))
                                   (ask cercle 'GeometrieCercle 1 1 1)
                                   (if (<= (+ (ask cercle 'distance x1 y1 x y)
                                              (ask cercle 'distance x2 y2 x y))
                                           (ask cercle 'distance x1 y1 x2 y2))
                                       (cons x y)
                                       #f))
                                 #f)))))
          
          ))
