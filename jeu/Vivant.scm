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

(classe Vivant
        ((privé vie))
        
        (
         (publique appliquerDommage (self v)
                   (ask self 'changerVie (- (ask self 'getSlot 'vie) (ask v 'dommage)))
                   (ask self 'verifier v))
         
         (publique changerVie (self v)
                   (if (< v 0)
                       (ask self 'setSlot 'vie 0)
                       (ask self 'setSlot 'vie v)))
         
         
         (publique verifier (self v)
                   (if (<= (ask self 'getSlot 'vie) 0)
                       (begin
                         ;(print (format "will give ~s to ~s" (ask v 'classe) (ask self 'points)))
                         (ask v 'ajouterPoints (ask self 'points))
                         (ask self 'enlever)
                         (ask self 'mourir)
                         ))
                   )
         
         ))