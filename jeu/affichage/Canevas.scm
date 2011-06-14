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
(classe Canevas 
        ((privé nom)
         (privé largeur)
         (privé hauteur)
         (privé viewPort)
         (privé plein)
         )
        (
         
         (publique largeur (self)
                   (ask self 'getSlot 'largeur))
         
         (publique hauteur (self)
                   (ask self 'getSlot 'hauteur))
         
         (publique plein! (self)
                   (ask self 'setSlot 'plein 0))
         
         (publique estPlein (self)
                   (= (ask self 'getSlot 'plein) 0))
         
         (publique estVide (self)
                   (= (ask self 'getSlot 'plein) 1))
         
         (publique pasPlein! (self)
                   (ask self 'setSlot 'plein 1))
         
         (publique enCours! (self)
                   (ask self 'setSlot 'plein 2))
         
         (publique cercle (self x y r couleur)
                   ((draw-ellipse (ask self 'getSlot 'viewPort)) 
                    (make-posn (- x r) (- y r)) (* 2 r) (* 2 r) couleur))
         
         (publique cercle-plein (self x y r couleur)
                   ((draw-solid-ellipse (ask self 'getSlot 'viewPort)) 
                    (make-posn (- x r) (- y r)) (* 2 r) (* 2 r) couleur))
         
         (publique Canevas (self nom x y type)
                   (ask self 'setSlot 'nom nom)
                   (ask self 'setSlot 'largeur x)
                   (ask self 'setSlot 'hauteur y)
                   (ask self 'pasPlein!)
                   (open-graphics)
                   (ask self 'setSlot 'viewPort 
                        ((if (equal? type 'viewport)
                             open-viewport
                             open-pixmap)
                         (ask self 'getSlot 'nom) 
                         (ask self 'getSlot 'largeur)
                         (ask self 'getSlot 'hauteur))))
         
         (publique ligne (self a b c d couleur)
                   ((draw-line (ask self 'getSlot 'viewPort)) (make-posn a b) 
                                                              (make-posn c d) couleur))
         
         (publique tracerImage (self fichier x y)
                   (if (and (> x 0) (> y 0) (< x (ask self 'getSlot 'largeur)) 
                            (< y (ask self 'getSlot 'hauteur)))
                       (((draw-pixmap-posn fichier 'gif/mask) 
                         (ask self 'getSlot 'viewPort)) (make-posn x y) #f)))
         
         (publique posnize (self liste)
                   (if (null? liste) null
                       (cons (make-posn (car liste) (cadr liste)) 
                             (ask self 'posnize (cddr liste)))))

         
         (publique rect (self x1 y1 x2 y2 x3 y3 x4 y4 couleur)
                   (ask self 'poly (list x1 y1 x2 y2 x3 y3 x4 y4) couleur))
         
         (publique texte (self texte x y couleur)
                   ((draw-string (ask self 'getSlot 'viewPort)) (make-posn x y) texte couleur))
         
         (publique poly (self liste couleur)
                   (let ((posn-list (ask self 'posnize liste))
                         (posn (make-posn 0 0)))
                     ((draw-polygon (ask self 'getSlot 'viewPort)) posn-list posn couleur))) 
         
         (publique poly-angle (self liste couleur x y angle)
                   ;(print liste)(newline)
                   (let ((posn-list (ask self 'posnize (ask (new 'GeometrieDeBase) 'tournerListe liste x y angle)))
                         (posn (make-posn 0 0)))
                     ;(print liste)(newline)
                     ;(print posn-list)(newline)
                     ((draw-solid-polygon (ask self 'getSlot 'viewPort)) posn-list posn couleur))) 
         
         (publique poly-plein (self liste couleur)
                   (let ((posn-list (ask self 'posnize liste))
                         (posn (make-posn 0 0)))
                     ((draw-solid-polygon (ask self 'getSlot 'viewPort)) posn-list posn couleur)))
         
         ;a faire:drape pixmap
         (publique dessiner-THREAD (self canevas)
                   (lambda () (ask self 'dessiner canevas)
                     ))
         
         (publique dessinerBoule (self x y r direction r2 g2 b2)
                   (define (iter x y r direction i r2 g2 b2)
                     (if (> i 0)
                         (begin
                           (ask self 'cercle-plein x y r (make-rgb r2 g2 b2))
                           (iter (+ x (* r (cos direction))) (+ y (* r -1 (sin direction))) (/ r 1.2) 
                                 ((if (< direction 0) + -) direction 0.1) (- i 1) (/ r2 1.1) r2 b2)
                           
                           )))
                   (iter x y r direction 10 r2 g2 b2)
                   )
         
         (publique nettoyer (self)
                   ((clear-viewport (ask self 'getSlot 'viewPort))))
         
         (publique dessiner (self canevas)
                   (copy-viewport (ask canevas 'getSlot 'viewPort) (ask self 'getSlot 'viewPort))
                   (ask canevas 'pasPlein!))
         
         ))
