
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



(classe BonusMissile hérite Bonus
        ()
        
        (
         (publique BonusMissile (self x y affichage moteur)
                   (ask self 'Bonus x y affichage moteur)
                   )
         
         (publique appliquerBonus (self objet)
                   (ask objet 'ajouterMissiles 3))
         
         
         ))