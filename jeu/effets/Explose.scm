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




(classe Explose 
        ()
        (
                  (publique mourir (self)
                 (new 'Explosion (ask self 'getSlot 'x) (ask self 'getSlot 'y) 1000 30 (make-rgb 0.7 0.2 0.1) #t self 1 (ask self 'getSlot 'affichage) (ask self 'getSlot 'moteur)))
                  
                  ))