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
(classe DessinCercle hérite Dessin 
              (
               (privé x)
               (privé y)
               (privé r))
              
              (
               
               (publique DessinCercle (self x y r)
  (ask self 'Dessin)
  (ask self 'setSlot 'x x)
  (ask self 'setSlot 'y y)
  (ask self 'setSlot 'rayon r))
               
               (publique dessiner (self canevas)
  (ask canevas 'cercle (ask self 'getSlot 'x) (ask self 'getSlot 'y) (ask self 'getSlot 'rayon)))
               
               ))
