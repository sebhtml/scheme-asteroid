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


(classe Calculable 
        (         (privé idMoteur)
         (privé geo)
         (privé moteur))
        (
         
         (publique x (self)
                   (ask self 'getSlot 'x))
         
         (publique y (self)
                   (ask self 'getSlot 'y))
         
         (publique mourir (self)
                   #f)
         
         (publique obtenirGeometrie (self)
                   (ask self 'getSlot 'geo))
         
         (publique enregistrerMoteur (self moteur)
                   (ask self 'setSlot 'idMoteur (ask moteur 'ajouter self))
                   (ask self 'setSlot 'moteur moteur))
         
         
         (publique collisionAvecPolygone (self poly)
                   (ask (ask self 'getSlot 'geo) 'collisionAvecPolygone cercle))
         
         (publique collisionAvecCercle (self cercle)
                   (ask (ask self 'getSlot 'geo) 'collisionAvecCercle cercle))
         
         (publique vivre (self)
                   (lambda () null))
         ))
