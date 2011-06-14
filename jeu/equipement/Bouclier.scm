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


(classe Bouclier hérite (Arme Vivant)
        (
         (privé débutAffichage)
         (privé couleur)
         )
        
        (
         
         (publique dureeAffichage (self)
                   150)
         
         (publique Bouclier (self propriétaire vie couleur)
                   (ask self 'setSlot 'proprio propriétaire)
                   (ask self 'setSlot 'vie vie)
               
                   (ask self 'setSlot 'couleur couleur)
                   (ask self 'setSlot 'débutAffichage (- (current-milliseconds) 10 (ask self 'dureeAffichage)))
                   (ask self 'changerGeo))
         
         (privé changerGeo (self)
                (let* ((prop (ask self 'proprio))
                          (x (ask prop 'getSlot 'x))
                          (y (ask prop 'getSlot 'y))
                          (r (if (<= (ask self 'getSlot 'vie) 0) 0 (ask prop 'rayonBouclier))))
                     (ask self 'setSlot 'geo (new 'GeometrieCercle x y r))))
         
         (publique appliquerDommage (self v)
                   (ask self 'additionnerAttribut 'vie (- (ask v 'dommage)))
                   (if (< (ask self 'getSlot 'vie) 0)
                       (ask self 'setSlot 'vie 0))
                   (ask self 'setSlot 'débutAffichage (current-milliseconds)))
         
         (publique vivre (self)
                   (ask self 'changerGeo))
         
         
         (publique dessiner (self canevas)
                   (if (< (- (current-milliseconds) (ask self 'getSlot 'débutAffichage)) (ask self 'dureeAffichage))
                   (let* ((prop (ask self 'proprio))
                          (x (ask prop 'getSlot 'x))
                          (y (ask prop 'getSlot 'y))
                          (r  (ask prop 'rayonBouclier)))
                     (ask canevas 'cercle x y r (ask self 'getSlot 'couleur))
                     )))
         
         
         ))