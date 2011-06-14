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


(classe Explosion hérite Arme
        
        ((prive couleur)
         (prive big)
         (prive x)
         (prive y)
         (prive debut)
         (prive duree)
         (prive rayon)
         (privé ouverture)
         (privé duree2)
         )
        
        (
         
         (privé grosse? (self)
                ;                (print "gro")(newline)
                (ask self 'getSlot 'big))
         
         (publique collisionAvecPolygone (self poly)
                   #f)
         
         (publique collisionAvecCercle (self cercle)
                   #f)
         
         (publique Explosion (self x y duree rayon couleur grosse proprio dommage affichage moteur)
                   ;(play-sound "sons/Explosion.wav" #t)
                   (ask self 'setSlot 'x x)
                   (ask self 'setSlot 'y y)
                   (ask self 'setSlot 'proprio proprio)
                   (ask self 'setSlot 'dommage dommage)
                   (ask self 'setSlot 'big grosse)
                   (ask self 'setSlot 'duree2 (/ duree 2))
                   (ask self 'setSlot 'ouverture (- (/ rayon (expt (- 0 (/ duree 2)) 2))))
                   (ask self 'setSlot 'duree duree)
                   (ask self 'setSlot 'debut (current-milliseconds))
                   (ask self 'setSlot 'rayon rayon)
                   (ask self 'setSlot 'couleur couleur)
                   (ask self 'Dessin  affichage moteur)
                   )
         
         (privé temps (self)
                (let ((a (- (current-milliseconds) (ask self 'getSlot 'debut))))
                  ;(print a)(newline)
                  a
                  ))
         
         (privé rayon (self)
                (let ((a (+ (* (ask self 'getSlot 'ouverture) (expt (- (ask self 'temps) (ask self 'getSlot 'duree2)) 2))
                           (ask self 'getSlot 'rayon))))
                  ;(print a)(newline)
                  (if (< a 0) 0 a)))
         
         (privé appliquerExplosion (self)
                (define (iter valeurs)
                  (if (not (null? valeurs))
                      (let* ((premier (car valeurs))
                             (autres (cdr valeurs))
                             (objet (ask premier 'objet))
                             (point (ask premier 'point))
                             (x (car point))
                             (y (cdr point))
                             (exp (new 'Explosion x y 1000 10 (make-rgb 0.7 0.2 0.5) #f self 5 (ask self 'getSlot 'affichage) (ask self 'getSlot 'moteur))))
                        ;(print (classe-objet objet))(newline)
                        (ask objet 'appliquerDommage self)
                        (iter autres)
                        )))
                (let ((collisions (ask (ask self 'getSlot 'moteur) 'collisionsAvecCercle (new 'GeometrieCercle (ask self 'getSlot 'x) (ask self 'getSlot 'y) (ask self 'rayon)))))
                  
                  (iter collisions)))
         
         (publique vivre (self)
                   (if (> (- (current-milliseconds) (ask self 'getSlot 'debut))
                          (ask self 'getSlot 'duree))
                       (ask self 'enlever))
                   (if (and (ask self 'grosse?) (< (random 10) (random 6)))
                       (ask self 'appliquerExplosion)
                       )
                   )
         
         (publique dessiner (self canevas)
                   (let ((x (ask self 'getSlot 'x))
                         (y (ask self 'getSlot 'y))
                         (r (ask self  'rayon))
                         (co (ask self 'getSlot 'couleur)))
                     (ask self 'rayon)
                     (ask canevas 'cercle-plein x y r co))
                   
                   )
         
         ))


