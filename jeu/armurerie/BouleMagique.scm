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

(classe BouleMagique hérite (Arme Invincible)
        
        (
         
         (privé rt)
         (privé x0)
         (privé y0)
         )
        
        (
         
         
         (publique dessiner (self canevas)
                   (let* ((x (ask self 'getSlot 'x))
                          (y (ask self 'getSlot 'y))
                          (r (ask self 'getSlot 'rt))
                          )
                     (ask canevas 'cercle-plein x y (+ r 3) (make-rgb 0.5 0 0))
                     (ask canevas 'cercle-plein x y r (make-rgb 1 0 0))
                     ))
         
         (publique BouleMagique (self x y direction proprio affichage moteur)
                   (ask self 'setSlot 'x x)
                   (ask self 'setSlot 'proprio proprio)
                   (ask self 'setSlot 'y y)
                   (ask self 'setSlot 'x0 x)
                   (ask self 'setSlot 'y0 y)
                   (ask self 'setSlot 'rt 5)
                   (ask self 'setSlot 'geo (new 'GeometrieCercle x y 5))
                   (ask self 'setSlot 'direction direction)
                   (ask self 'setSlot 'vitesse 2)
                   (ask self 'setSlot 'dommage 4)
                   (ask self 'àJourGéométrie)
                   (ask self 'Dessin  affichage moteur))
         
         (privé àJourGéométrie (self)
                (ask (ask self 'getSlot 'geo) 'setSlot 'x (ask self 'getSlot 'x))
                (ask (ask self 'getSlot 'geo) 'setSlot 'y (ask self 'getSlot 'y))
                )
         
         (publique vérifierDurée (self)
                   (let* ((cercle (new 'GeometrieDeBase))
                          (x0 (ask self 'getSlot 'x0))
                          (y0 (ask self 'getSlot 'y0))
                          (x1 (ask self 'getSlot 'x))
                          (y1 (ask self 'getSlot 'y))
                          (dis (ask cercle 'distance x0 y0 x1 y1)))
                     (if (> dis 400)
                         (ask self 'enlever))))
         
         (publique vérifierCollision (self)
                   (let ((collision 
                          (ask (ask self 'getSlot 'moteur) 'collisionAvecCercle (ask self 'obtenirGeometrie)))) 
                     (if (not (null? collision))
                         (let ((objet (ask collision 'objet))
                               (exp (new 'Explosion (ask self 'getSlot 'x) (ask self 'getSlot 'y) 100 10 (make-rgb 0.3 0.6 0.1) #t self 9 (ask self 'getSlot 'affichage) (ask self 'getSlot 'moteur))))
                            (if (not (equal? (ask objet 'proprio) (ask self 'proprio)))
                           (begin
                           (ask objet 'appliquerDommage self)
                           (ask self 'enlever)
                           )))))
                   )
         
         (publique vivre (self)
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
                     (ask self 'additionnerAttribut 'vitesse 1)
                     
                     )
                   (ask self 'àJourGéométrie)
                       (ask self 'vérifierCollision)
                   (ask self 'vérifierDurée)
                   )
         )
        )
