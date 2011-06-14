
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



(classe ADesPoints 
        (         (privé points))
        
        (        
         (publique points (self)
                   (ask self 'getSlot 'points))
         
         
         (publique ajouterPoints (self v)
                   ;(print "yay ")(print v)(newline)
                   (ask self 'setSlot 'points (+ (ask self 'points) v))
                   )
         ))