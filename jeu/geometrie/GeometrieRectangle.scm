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
(classe GeometrieRectangle hérite GeometrieDeBase 
        (
         (privé x1)
         (privé y1)
         (privé x2)
         (privé y2)
         (privé x3)
         (privé y3)
         (privé x4)
         (privé y4)
         )
        
        (
         
         (publique GeometrieRectangle (self x1 y1 x2 y2 x3 y3 x4 y4)
                 (ask self 'setSlot 'x1 x1)
                 (ask self 'setSlot 'y1 y1)
                 (ask self 'setSlot 'x2 x2)
                 (ask self 'setSlot 'y2 y2)
                 (ask self 'setSlot 'x3 x3)
                 (ask self 'setSlot 'y3 y3)
                 (ask self 'setSlot 'x4 x4)
                 (ask self 'setSlot 'y4 y4))
         
         ; @author Sébastien
         ; for each point + 1 point for each pair ( 8 au total vérifier si le cercle les contient
         (publique collisionAvecCercle (self cercle)
                 (let ((x1 (ask self 'getSlot 'x1))
                       (y1 (ask self 'getSlot 'y1))
                       (x2 (ask self 'getSlot 'x2))
                       (y2 (ask self 'getSlot 'y2))
                       (x3 (ask self 'getSlot 'x3))
                       (y3 (ask self 'getSlot 'y3))
                       (x4 (ask self 'getSlot 'x4))
                       (y4 (ask self 'getSlot 'y4)))
                   (cond 
                     ((ask cercle 'contientDroite x1 y1 x2 y2) (ask cercle 'contientDroite x1 y1 x2 y2))
                     ((ask cercle 'contientDroite x2 y2 x3 y3)      (ask cercle 'contientDroite x2 y2 x3 y3))
                     ((ask cercle 'contientDroite x3 y3 x4 y4)     (ask cercle 'contientDroite x3 y3 x4 y4))
                     ((ask cercle 'contientDroite x4 y4 x1 y1) (ask cercle 'contientDroite x4 y4 x1 y1))
                     (else #f))))
         
         ; @author Sébastien
         ; TODO: c'est un STUB
         (publique contient (self x y)
                 #f)
         
         ))
