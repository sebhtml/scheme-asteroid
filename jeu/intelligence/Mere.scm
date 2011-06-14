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


(classe Mere 
        ((privé joueur)
         (privé jeu)
         )
        
        (
         
         (publique créerTrucs (self)
                   (ask self 'niveau1)
                   (ask self 'créerTrucs))
         
         (privé endroitLibre (self)
                (sleep 1)
                (let* ((x (+ 100 (random 700)))
                       (y (+ 100 (random 500)))
                       (geo (new 'GeometrieCercle x y 150))
                       (jeu (ask self 'getSlot 'jeu))
                       (moteur (ask jeu 'getSlot 'moteur))
                       (collision (ask moteur 'collisionAvecCercle geo)))
                  (if (null? collision)
                      (cons x y)
                      (ask self 'endroitLibre))
                  ))
         
         (privé créerRoche (self)
                (let* (
                       (endroit (ask self 'endroitLibre))
                       (x (car endroit))
                       (y (cdr endroit))
                       (r (+ 20 (random 100)))
                       (v (+ 1 (random 4))))
                  (new 'Roche x y v                       (ask (ask self 'getSlot 'jeu) 'getSlot 'affichage)                       (ask (ask self 'getSlot 'jeu) 'getSlot 'moteur))))
         
         (privé créerGobelin (self)
                (let* (
                       (endroit (ask self 'endroitLibre))
                       (x (car endroit))
                       (y (cdr endroit)))
                  (new 'Gobelin x y (ask self 'getSlot 'joueur) (ask (ask self 'getSlot 'jeu) 'getSlot 'affichage)                       (ask (ask self 'getSlot 'jeu) 'getSlot 'moteur))
                  ))
         
         (privé créerBonus (self)
                (let* ((bonus '(BonusBouclier BonusVie BonusMissile BonusLaser BonusPiege BonusRien BonusMonstre))
                       (leBonus (list-ref bonus (random (length bonus))))
                       (endroit (ask self 'endroitLibre))
                       (x (car endroit))
                       (y (cdr endroit)))
                  (new leBonus x y (ask (ask self 'getSlot 'jeu) 'getSlot 'affichage)                       (ask (ask self 'getSlot 'jeu) 'getSlot 'moteur)
                )))
         
         (privé niveau1 (self)
                (ask self 'créerGobelin)
                (ask self 'créerRoche)
                (ask self 'créerBonus))
         
         (publique créerTrucs-THREAD (self)
                   (lambda () (ask self 'créerTrucs)))
         
         (publique Mere (self joueur jeu)
                   (ask self 'setSlot 'joueur joueur)
                   (ask self 'setSlot 'jeu jeu)
)
         )
        )
