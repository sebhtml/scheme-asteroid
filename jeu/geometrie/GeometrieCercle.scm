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
(classe GeometrieCercle hérite  GeometrieDeBase 
        ((privé x)
         (privé y)
         (privé r))
        (
         
         (publique x (self)
                 (ask self 'getSlot 'x))
         
         (publique y (self)
                 (ask self 'getSlot 'y))
         
         (publique r (self)
                 (ask self 'getSlot 'r))
         
         (publique GeometrieCercle (self x y r)
                 (ask self 'setSlot 'x x)
                 (ask self 'setSlot 'y y)
                 (ask self 'setSlot 'r r))
         
         ; un peu de géométrie vectorielle.......
         ; point d'intersection avec un autre cercle
         (publique point (self cercle)
                 (let* ((r (ask self 'r))
                        (gamma (ask cercle 'r))
                        (ratio (/ r (+ r gamma)))
                        (a_x (ask self 'getSlot 'x))
                        (a_y (ask self 'getSlot 'y))
                        (c_x (ask self 'getSlot 'x))
                        (c_y (ask self 'getSlot 'y))
                        (ac_x (- c_x a_x))
                        (ac_y (- c_y a_y))
                        (ab_x (* ratio ac_x))
                        (ab_y (* ratio ac_y))
                        (b_x (+ a_x ab_x))
                        (b_y (+ a_y ab_y)))
                   (cons b_x b_y)))
         
         ; @author Sébastien
         ; @modif Pier-Luc
         (publique contientDroite (self x1 y1 x2 y2)
                 (cond ((ask self 'contient x1 y1) (cons x1 y1))
                       ((ask self 'contient x2 y2) (cons x2 y2))
                       (else 
                        (let* ((a_x (ask self 'getSlot 'x))
                               (a_y (ask self 'getSlot 'y))
                               (b_x x1)
                               (b_y y1)
                               (c_x x2)
                               (c_y y2)
                               (ba_x (- a_x b_x))
                               (ba_y (- a_y b_y))
                               (bc_x (- c_x b_x))
                               (bc_y (- c_y b_y))
                               (ba_bc-scalaire (+ (* ba_x bc_x) (* ba_y bc_y)))
                               (norme_bc (sqrt
                                          (+ (expt bc_x 2)
                                             (expt bc_y 2))))
                               (norme_bd (/ ba_bc-scalaire norme_bc))
                               (ratio (/ norme_bd norme_bc))
                               (bd_x (* bc_x ratio))
                               (bd_y (* bc_y ratio))
                               (d_x (+ b_x bd_x))
                               (d_y (+ b_y bd_y))
                               (distance (ask self 'distance a_x a_y d_x d_y)))
                          ; mise en place des limites de la droite
                          (if (and (<= distance (ask self 'r))  
                                   (let ((max_x (max x1 x2))
                                         (min_x (min x1 x2))
                                         (min_y (min y1 y2))
                                         (max_y (max y2 y1)))
                                     (not (or (< d_x min_x)
                                              (> d_x max_x)
                                              (< d_y min_y)
                                              (> d_y max_y)))))
                              
                              (cons d_x d_y) 
                              #f)
                          )
                        )))
         
         (publique collisionAvecCercle (self cercle)
                 ;  (print "Egalite...")(newline)
                 ;  (print self)(newline)
                 ;  (print cercle)(newline)
                 ;  (print (equal? self cercle))(newline)
                 (if (equal? self cercle)
                     #f
                     (begin 
                       ;               (print self)(newline)
                       ;       (print cercle)(newline)
                       (if (<=      (- (sqrt 
                                        (+ (expt (- (ask self 'getSlot 'x) (ask cercle 'getSlot 'x)) 2)
                                           (expt (- (ask self 'getSlot 'y) (ask cercle 'getSlot 'y)) 2))) 
                                       0)
                                    (+ 
                                     (ask self 'getSlot 'r)
                                     (ask cercle 'getSlot 'r)))
                           (ask self 'point cercle)
                           #f))))
         
         (publique contient (self x y)
                 (let ((dis (ask self 'distance (ask self 'getSlot 'x)
                                 (ask self 'getSlot 'y) x y))
                       (ray (ask self 'getSlot 'r)))
                   ;  (print (format "~s ~s" dis ray))(newline)
                   (<=    dis  ray           )))
         
         ))
