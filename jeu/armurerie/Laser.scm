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

(classe Laser hérite (Arme Invincible)
        
        (
         (privé acceleration)
         (privé largeur)
         (privé hauteur)
         (privé x1)
         (privé y1)
         (privé x2)
         (privé y2)
         (privé x0)
         (privé y0)
         )
        
        (
         
         
         (publique dessiner (self canevas)
                   (let* ((x1 (ask self 'getSlot 'x1))
                          (y1 (ask self 'getSlot 'y1))
                          (x2 (ask self 'getSlot 'x2))
                          (y2 (ask self 'getSlot 'y2)))
                     (ask canevas 'poly (list x1 y1 x2 y1 x2 y2 x1 y2) (make-rgb 0.2 0.2 1))
                     #f))
         
         (publique Laser (self x y direction proprio)
                   (ask self 'setSlot 'x x)
                   (ask self 'setSlot 'x0 x)
                   (ask self 'setSlot 'proprio proprio)
                   (ask self 'setSlot 'y y)
                   (ask self 'setSlot 'y0 y)
                   (ask self 'setSlot 'largeur 4)
                   (ask self 'setSlot 'hauteur 4)
                   (ask self 'setSlot 'geo (new 'GeometrieCercle x y 3))
                   (ask self 'setSlot 'direction direction)
                   (ask self 'setSlot 'vitesse 4)
                   (ask self 'setSlot 'dommage 8)
                   (ask self 'setSlot 'acceleration 2)
                   (ask self 'àJourGéométrie))
         
         (privé àJourGéométrie (self)
                (let* ((x (ask self 'getSlot 'x))
                       (y (ask self 'getSlot 'y))
                       (lar (ask self 'getSlot 'largeur))
                       (hau (ask self 'getSlot 'hauteur))
                       (x1 (- x (/ lar 2)))
                       (x2 (+ x (/ lar 2)))
                       (y1 (- y (/ hau 2)))
                       (y2 (+ y (/ hau 2))))
                  (ask self 'setSlot 'x1 x1)
                  (ask self 'setSlot 'x2 x2)
                  (ask self 'setSlot 'y1 y1)
                  (ask self 'setSlot 'y2 y2)
                  
                  ;(ask self 'setSlot 'geo (new 'GeometriePolygone x y (list x1 y1 x2 y1 x2 y2 x1 y2)))
                  (ask (ask self 'getSlot 'geo) 'setSlot 'x (ask self 'getSlot 'x))
                  (ask (ask self 'getSlot 'geo) 'setSlot 'y (ask self 'getSlot 'y))
                  ;                   (print (ask self 'obtenirGeometrie))
                  ))
         
         (publique vérifierDurée (self)
                   (let* ((cercle (new 'GeometrieDeBase))
                          (x0 (ask self 'getSlot 'x0))
                          (y0 (ask self 'getSlot 'y0))
                          (x1 (ask self 'getSlot 'x))
                          (y1 (ask self 'getSlot 'y))
                          (dis (ask cercle 'distance x0 y0 x1 y1)))
                     (if (> dis 200)
                         (ask self 'enlever))))
         
         
         
         
         (publique vivre (self)
                   (let* ((vitesse (ask self 'getSlot 'vitesse))
                          (x (ask self 'getSlot 'x))
                          (y (ask self 'getSlot 'y))
                          (acceleration (ask self 'getSlot 'acceleration))
                          (direction (ask self 'getSlot 'direction))
                          (dx (* vitesse (cos direction)))
                          (dy (* vitesse (* -1 (sin direction))))
                          (newX (+ x dx))
                          (newY (+ y dy))
                          (newVitesse (+ vitesse acceleration)))
                     (ask self 'setSlot 'x newX)
                     (ask self 'setSlot 'y newY)
                     (ask self 'setSlot 'vitesse newVitesse)
                     )
                   (ask self 'àJourGéométrie)
                   (let ((collision 
                          (ask (ask self 'getSlot 'moteur) 'collisionAvecCercle (ask self 'obtenirGeometrie)))) 
                     (if (not (null? collision))
                         (let ((objet (ask collision 'objet))
                               (exp (new 'Explosion (ask self 'getSlot 'x) (ask self 'getSlot 'y) 1300 10 (make-rgb 0.3 0.2 0.1) #f self 6 (ask self 'getSlot 'affichage) (ask self 'getSlot 'moteur)))
                               )
                           (if (not (equal? (ask objet 'proprio) (ask self 'proprio)))
                           (begin
                             (ask objet 'appliquerDommage self)
                           (ask self 'enlever)
                           ;(play-sound "images/kasteroids/sounds/Explosion.wav" #t)
                           
                           )))))
                   (ask self 'vérifierDurée)
                   )
         )
        )
