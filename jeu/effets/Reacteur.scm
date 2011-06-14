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

(classe Reacteur
        ((privé avion)
         (privé couleur))
        
        (
         
         (publique Reacteur (self avion couleur)
                   (ask self 'setSlot 'avion avion)
                   (ask self 'setSlot 'couleur couleur))
         
         
         (publique afficher (self canevas)
                   (define (iter x y i)
                     (if (> i 0)
                         (begin (ask canevas 'cercle (+ x (- (random 4) 2)) (+ y (- (random 4) 2)) (+ 4 (random 15)) (ask self 'getSlot 'couleur))
                                (iter x y (- i 1))
                                )))
                   (let* ((dis 25)
                          (avion (ask self 'getSlot 'avion))
                          (x (ask avion 'x))
                          (y (ask avion 'y))
                          (x2 (- x (* dis (cos (ask avion 'angleAvion))) ))
                          (y2 (- y (* dis (* -1 (sin (ask avion 'angleAvion)))) )))
                     (iter x2 y2 10)))
         
         ))
