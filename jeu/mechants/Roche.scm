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
(classe Roche hérite (Mechant Detectable Explose)
        (
         (privé rayon)
         (privé angle)
         (privé vitesse)
         (privé accel)
         (privé geoBase)
         )
        
        (
         (publique dommage (self)
                   0.5)
         
         (publique Roche (self x y v affichage moteur)
                   (ask self 'Dessin affichage moteur)
                   (ask self 'setSlot 'x x)
                   (ask self 'setSlot 'y y)
                   (ask self 'setSlot 'angle (/ pi 2))
                   (ask self 'setSlot 'rayon 10)
                   (ask self 'setSlot 'points 100)
                   (ask self 'setSlot 'vie 9)
                   (ask self 'setSlot 'proprio self)
                   (ask self 'setSlot 'geoBase (new 'GeometrieDeBase))
                   (ask self 'setSlot 'vitesse v)
                   (ask self 'setSlot 'accel 0)
                   (let ((geometrie (new 'GeometrieCercle (ask self 'getSlot 'x)
                                         (ask self 'getSlot 'y)
                                         (ask self 'getSlot 'rayon))))
                     (ask self 'setSlot 'geo geometrie)))
         
         (publique dessiner (self canevas)
                   (let ((x (ask self 'getSlot 'x))
                         (y (ask self 'getSlot 'y))
                         (r (ask self 'getSlot 'rayon)))
                     (ask canevas 'cercle-plein x y r (make-rgb 1 0 0))
                     (ask canevas 'cercle-plein x y (- r 3) (make-rgb 0.7 0 0))
                     (ask canevas 'cercle-plein x y (- r 6) (make-rgb 0.5 0 0))
                     ))
         
         (publique changerVitesse (self v)
                   (if (< v 0)
                       (ask self 'setSlot 'vitesse 0)
                       (if (< v 12)
                           (ask self 'setSlot 'vitesse v))))
                  
         (publique changerY (self y)
                   (ask self 'setSlot 'y y)
                   (ask (ask self 'getSlot 'geo) 'setSlot 'y y))
         
         (publique changerX (self x)
                   (ask self 'setSlot 'x x)
                   (ask (ask self 'getSlot 'geo) 'setSlot 'x x))

         (publique vivre (self)
                   (let ((collision (ask (ask self 'getSlot 'moteur) 'collisionAvecCercle (ask self 'obtenirGeometrie)))) 
                     (if (not (null? collision))
                         (begin 
                           (let* ((point (ask collision 'point))
                                  (objet (ask collision 'objet))
                                  (geo (ask self 'getSlot 'geoBase))
                                  
                                  (beta (ask geo 'angle
                                             (car point)
                                             (cdr point)
                                             (ask self 'x)
                                             (ask self 'y)))
                                  (theta (ask self 'getSlot 'angle))
                                  (nouvelAngle (+ theta pi (* 2 (- beta theta)))))
                             (ask objet 'appliquerDommage self)
                             (ask self 'setSlot 'angle nouvelAngle)
                             ))))
                   (ask self 'changerX (+ (ask self 'getSlot 'x) (* (ask self 'getSlot 'vitesse) (cos (ask self 'getSlot 'angle)))))
                   (ask self 'changerY (+ (ask self 'getSlot 'y) (* (ask self 'getSlot 'vitesse) (sin (ask self 'getSlot 'angle)))))
                   (ask self 'changerVitesse (+ (ask self 'getSlot 'vitesse) (ask self 'getSlot 'accel))))
         
         ))
