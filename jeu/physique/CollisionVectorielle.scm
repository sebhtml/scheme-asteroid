;Sébastien Boisvert <Sebastien.Boisvert@USherbrooke.ca>  

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
(classe CollisionVectorielle 
              ((privé point)
               (privé objet))
              (
               
               (publique CollisionVectorielle (self point objet)
  (ask self 'setSlot 'point point)
  (ask self 'setSlot 'objet objet))
               
               (publique point (self)
  (ask self 'getSlot 'point))
               
               (publique objet (self)
  (ask self 'getSlot 'objet))
               
               ))
