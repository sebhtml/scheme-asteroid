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
; moteur de collision vectoriel
; les entrées doivent avoir la méthode collisionAvecCercle
; d'autres entrées pourront être déclarées, ils utiliseront des formes primitives
; formes primitives: cercle, rectangle, polygone
; plus que le polygone a de côté, plus c'est lourd
; pour le cercle, c'est très simple.

(classe MoteurCollisions
        (
         (privé table)
         (privé frequence)
         (privé durée)
         (privé index)
         )
        (
         
         ; constructeur
         ; @author Sébastien
         (publique MoteurCollisions (self frequence)
                   (ask self 'setSlot 'table (new 'TableDispersion))
                   (ask self 'setSlot 'frequence frequence)
                   (ask self 'setSlot 'durée (/ 1.0 frequence))
                   (ask (ask self 'getSlot 'table) 'TableDispersion)
                   (ask self 'setSlot 'index 22))
         
         
         ; ajouter une géométrie
         ; @return un identifiant unique
         ; @author Sébastien
         (publique ajouter (self proprietaire)
                   (let ((a (ask self 'nouvelIndex)))
                     (ask (ask self 'getSlot 'table) 'mettre a proprietaire)
                     a))
         
         (publique aller (self)
                   (define (iter objets)
                     (if (not (null? objets))
                         (let ((premier (car objets))
                               (autres (cdr objets)))
                           (ask premier 'vivre)
                           (iter autres))))
                   ;(print "Physique...")(newline)
                   (let ((objets (ask (ask self 'getSlot 'table) 'valeurs)))
                     (iter objets))
                   (sleep (ask self 'getSlot 'durée))
                   (ask self 'aller))
         
         (publique aller-THREAD (self)
                   (lambda () (ask self 'aller)))
         
         (publique nouvelIndex (self)
                   (ask self 'setSlot 'index (+ (ask self 'getSlot 'index) 1))
                   (ask self 'getSlot 'index))
         
         ; enlever une géométrie
         (publique enlever (self identifiant)
                   (ask (ask self 'getSlot 'table) 'enlever identifiant))         
         
         (publique collisionAvecCercle (self objet)
                   (define (iter valeurs)
                     (if (null? valeurs) null
                         (let* ((valeur (car valeurs))
                                (pointCollision (ask valeur 'collisionAvecCercle objet)))
                           (if pointCollision
                               (let ((collision (new 'CollisionVectorielle pointCollision valeur)))
                                 collision)
                               (iter (cdr valeurs))))))
                   ;(if (< (random 13) 5)
                       (let ((valeurs (ask (ask self 'getSlot 'table) 'valeurs)))
                         (iter valeurs))
                       ;null)
         )
         
         (publique collisionsAvecCercle (self objet)
                   (define (iter valeurs)
                     (if (null? valeurs) null
                         (let* ((valeur (car valeurs))
                                (pointCollision (ask valeur 'collisionAvecCercle objet)))
                           (if pointCollision
                               (let ((collision (new 'CollisionVectorielle pointCollision valeur)))
                                 (cons collision (iter (cdr valeurs))))
                               (iter (cdr valeurs))))))
                       (let ((valeurs (ask (ask self 'getSlot 'table) 'valeurs)))
                         (iter valeurs))
         )
         
         (publique obtenirProprietaire   (self x y)
                   (define (iter valeurs)
                     (if (null? valeurs) null
                         (let ((premier (car valeurs)))
                           (if (ask premier 'contient x y) premier
                               (iter (cdr valeurs))))))
                   (let ((valeurs (ask (ask self 'getSlot 'table) 'valeurs)))
                     (iter valeurs)))
         
         (publique obtenir (self identifiant)
                   (ask (ask self 'getSlot 'table) 'obtenir identifiant))
         
         ))
