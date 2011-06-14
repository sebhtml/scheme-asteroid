
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



(classe BonusPiege hérite Bonus
        ()
        
        (
         (publique BonusPiege (self x y affichage moteur)
                   (ask self 'Bonus x y affichage moteur)
                   )
         
         (publique appliquerBonus (self objet)
                   (new 'MissileGuide (ask self 'getSlot 'x) (ask self 'getSlot 'y) 0 objet (ask objet 'getSlot 'affichage) (ask objet 'getSlot 'moteur) 0))
         
         
         ))