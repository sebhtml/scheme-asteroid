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
(classe DessinPolygone hérite (Dessin Invincible)
        ((privé sommets)
         (privé couleur)
        )
(
         
         (publique mechant? (self)
                   #t)
         
         (publique dommage (self)
                   1)
         
         (publique DessinPolygone (self x y sommets affichage moteur couleur)
                   (ask self 'Dessin affichage moteur)
                   (ask self 'setSlot 'sommets sommets)
                   (ask self 'setSlot 'couleur couleur)
                   (let ((geometriePolygone (new 'GeometriePolygone x y sommets)))
                     (ask self 'setSlot 'geo geometriePolygone)))
         
         (publique dessiner (self canevas)
                   (ask canevas 'poly (ask self 'getSlot 'sommets) (ask self 'getSlot 'couleur)))
         
         (publique collisionAvecCercle (self cercle)
                   (ask (ask self 'obtenirGeometrie) 'collisionAvecCercle cercle))
         
         
         (publique dessiner (self canevas)
                   (ask canevas 'poly          
                        (ask self 'getSlot 'sommets)))
         
         ))

