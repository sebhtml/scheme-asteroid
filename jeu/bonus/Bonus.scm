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



(classe Bonus hérite (Dessin Invincible)
        ((privé début))
        
        
        (
         
         (publique Bonus (self x y affichage moteur)
                   (ask self 'setSlot 'x x)
                   (ask self 'setSlot 'début (current-seconds))
                   (ask self 'setSlot 'y y)
                   (ask self 'Dessin affichage moteur)
                   (ask self 'setSlot 'geo (new 'GeometrieCercle x y 9))
                   )
         
         (publique dessiner (self canevas)
                   (ask canevas 'poly (ask (new 'GeometrieDeBase) 'genererPolygone (ask self 'getSlot 'x) (ask self 'getSlot 'y) 10 5)
                        (make-rgb 0.4 0.2 1))
                   (ask canevas 'poly-plein (ask (new 'GeometrieDeBase) 'genererPolygone (ask self 'getSlot 'x) (ask self 'getSlot 'y) 7 5)
                        (make-rgb 0.4 0.2 1))
                   )
         
         (publique collisionAvecCercle (self cercle)
                   #f)
         
         (publique vivre (self)
                   (ask self 'vérifierDurée)
                   (ask self 'vérifierCollision))
         
         (publique vérifierCollision (self)
                   (define (iter collisions)
                     (if (not (null? collisions))
                         (let ((premier (car collisions))
                               (autres (cdr collisions)))
                     (let ((objet (ask premier 'objet)))
                           (if (equal? 'AvionJoueur (ask objet 'classe))
                               (begin
                                 (ask self 'appliquerBonus objet)
                                 (ask self 'enlever))
                               (iter autres))
                           
                           ))))
                   (let ((collisions 
                          (ask (ask self 'getSlot 'moteur) 'collisionsAvecCercle (ask self 'obtenirGeometrie)))) 
                     (if (not (null? collisions))
                         (iter collisions)
                         )))
         
         (publique appliquerBonus (self objet)
                   (print "BONUS")(newline))
         
         (publique vérifierDurée (self)
                   (if (> (- (current-seconds) (ask self 'getSlot 'début)) 10)
                       (ask self 'enlever)))
         
         
         ))