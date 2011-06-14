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
(classe Dessin hérite (Affichable Calculable ADesPoints)
        (
         (privé x)
         (privé y)
         (privé vitesse)
         (privé mort)
         (privé proprio)
         )
        
        (
         (publique détectable? (self)
                   #f)
         
         (publique proprio (self)
                   (ask self 'getSlot 'proprio))
         
         (publique estMort (self)
                   (ask self 'getSlot 'mort))
         
         (publique changerVitesse (self v)
                   #f)
         
         (publique vitesse (self)
                   (ask self 'getSlot 'vitesse))
         
         (publique Dessin (self affichage moteur)
                   (ask self 'enregistrerAffichage affichage)
                   (ask self 'enregistrerMoteur moteur)
                   (ask self 'setSlot 'mort #f)
                   (ask self 'setSlot 'vitesse 0))
         
         (publique mechant? (self)
                   #f)
         
         (publique enlever (self)
                   (ask (ask self 'getSlot 'moteur) 'enlever (ask self 'getSlot 'idMoteur))
                   (ask (ask self 'getSlot 'affichage) 'enlever (ask self 'getSlot 'idAffichage))
                   (ask self 'setSlot 'mort #t))
         

         
         (publique géo= (self v)
                   (ask self 'setSlot 'geo v))
         
         ))


