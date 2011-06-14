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


(classe Affichable
        (         (privé idAffichage)
                  (privé affichage))
        (
         (publique enregistrerAffichage (self affichage)
                   (ask self 'setSlot 'idAffichage (ask affichage 'ajouter self))
                   (ask self 'setSlot 'affichage affichage))
         
         (publique dessiner (self canevas)
                   #f)
         )
        )
