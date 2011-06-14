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


(classe Arme hérite Dessin
        ((privé vitesse)
         (privé direction)
         (privé dommage)
         (privé proprio))
        
        (
         
         (publique proprio (self)
                   (ask self 'getSlot 'proprio))
         
         (publique méchant? (self)
                   #t)
         
         (publique dommage (self)
                   (ask self 'getSlot 'dommage))
         
         (publique Arme (self)
                   #f)
         
         (publique ajouterPoints (self v)
                   ;(print (format "to him ~s" (ask (ask self 'proprio) 'classe)))(newline)
                   (ask (ask self 'proprio) 'ajouterPoints v)
                   )
         ))