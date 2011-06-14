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


(classe MissileGuide hérite (Arme Invincible)
        (
         (privé cible)
         (privé geoBase)
         )
        
        (
         (publique dessiner (self canevas)
                   (let* ((x (ask self 'getSlot 'x))
                          (y (ask self 'getSlot 'y))
                          )
                     ;(print (format "~s ~s ~s" x y (ask self 'getSlot 'direction)))(newline)
                     (ask canevas 'poly-angle (ask (new 'GeometrieDeBase) 'genererPolygone x y 10 5)
                          (make-rgb 0.2 0.2 1) x y (ask self 'getSlot 'direction))
                     (ask canevas 'poly-angle (ask (new 'GeometrieDeBase) 'genererPolygone (+ 10 x) y 7 4)
                          (make-rgb 0.2 0.9 1) x y (ask self 'getSlot 'direction))
                     (ask canevas 'cercle x y (ask self 'vision)
                          (make-rgb 0.78 0.2 0.4))
                     #f))
         
         
         (publique chasser (self)
                   ;                   (print "hunting ")(print (ask self 'getSlot 'cible) )(newline)
                   (let* ((cible (ask self 'getSlot 'cible))
                          (x0 (ask self 'getSlot 'x))
                          (y0 (ask self 'getSlot 'y))
                          (x1 (ask cible 'getSlot 'x))
                          (y1 (ask cible 'getSlot 'y))
                          (direction (ask self 'getSlot 'direction))
                          (vitesse (ask self 'getSlot 'vitesse))
                          (geo (ask self 'getSlot 'geoBase))
                          (angleV (ask geo 'angle x0 y0 x1 y1))
                          (max-angle (/ pi 50))
                          (delta (- angleV direction))
                          (angleV2-delta (if (> (abs delta) max-angle) 
                                             (if (> delta 0) max-angle (- max-angle)) delta))
                          (angleV2 (+ direction angleV2-delta))
                          (dx (* vitesse (cos angleV2)))
                          (dy (* vitesse (* -1 (sin angleV2))))
                          (newX (+ x0 dx))
                          (newY (+ y0 dy))
                          )
                     (ask self 'setSlot 'x newX)
                     (ask self 'setSlot 'y newY)
                     (ask (ask self 'getSlot 'geo) 'setSlot 'x (ask self 'getSlot 'x))
                     (ask (ask self 'getSlot 'geo) 'setSlot 'y (ask self 'getSlot 'y))
                     (ask self 'setSlot 'direction angleV2)))
         
         (privé trouverCible (self collisions)
                (define (iter valeurs)
                  (if (not (null? valeurs))
                      (let ((collision (car valeurs))
                            (autres (cdr valeurs)))
                        (if (ask (ask collision 'objet) 'détectable?)           
                            (begin (ask self 'setSlot 'cible (ask collision 'objet))
                                   (ask self 'setSlot 'vitesse 3)
                                   )
                            (iter autres)))))
                ;                                (print collisions)(newline)
                (iter collisions)
                )
         
         (privé vision (self)
                100)
         
         (privé bouger (self)
                (let ((collisions
                       (ask (ask self 'getSlot 'moteur) 'collisionsAvecCercle (new 'GeometrieCercle (ask self 'getSlot 'x) (ask self 'getSlot 'y) (ask self 'vision)))))
                  (if  (not (null? collisions))
                       (ask self 'trouverCible collisions))
                  (let* ((vitesse (ask self 'getSlot 'vitesse))
                         (x (ask self 'getSlot 'x))
                         (y (ask self 'getSlot 'y))
                         (direction (ask self 'getSlot 'direction))
                         (dx (* vitesse (cos direction)))
                         (dy (* vitesse (* -1 (sin direction))))
                         (newX (+ x dx))
                         (newY (+ y dy))
                         )
                    (ask self 'setSlot 'x newX)
                    (ask self 'setSlot 'y newY)
                    ;(ask self 'setSlot 'vitesse newVitesse)
                    (ask (ask self 'getSlot 'geo) 'setSlot 'x (ask self 'getSlot 'x))
                    (ask (ask self 'getSlot 'geo) 'setSlot 'y (ask self 'getSlot 'y))
                    )))
         
         (publique vivre (self)
                   (if (not (null? (ask self 'getSlot 'cible)))
                       (ask self 'chasser)
                       (ask self 'bouger))   
                   (ask self 'détecterCollision)
                   )
         
         
         (privé détecterCollision (self)
                (let ((collision 
                       (ask (ask self 'getSlot 'moteur) 'collisionAvecCercle (ask self 'obtenirGeometrie)))) 
                  (if (not (null? collision))
                      (let ((objet (ask collision 'objet))
                            (exp (new 'Explosion (ask self 'getSlot 'x) (ask self 'getSlot 'y) 500 160 (make-rgb 0.7 0.7 0.2) #t self 30 (ask self 'getSlot 'affichage) (ask self 'getSlot 'moteur))))
                        (if (not (and (equal? (ask objet 'proprio) (ask self 'proprio)) (or (eq? 'Gobelin (ask objet 'classe)) (eq? 'AvionJoueur (ask objet 'classe)))))
                            (begin
                              (ask objet 'appliquerDommage self)
                              (ask self 'enlever)                           
                              ))))))
         
         (publique MissileGuide (self x y direction proprio affichage moteur v)
                   (ask self 'setSlot 'x x)
                   (ask self 'setSlot 'y y)
                   (ask self 'setSlot 'cible null)
                   (ask self 'setSlot 'geoBase (new 'GeometrieDeBase))
                   (ask self 'setSlot 'dommage 40)
                   (ask self 'setSlot 'direction direction)
                   (ask self 'setSlot 'proprio proprio)
                   (ask self 'setSlot 'geo (new 'GeometrieCercle x y 5))
                   (ask self 'Dessin  affichage moteur)
                   (ask self 'setSlot 'vitesse (+ 1 v))
                   )
         
         ))