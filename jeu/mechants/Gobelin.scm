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


(classe Gobelin hérite (Mechant ObjetPeutAvoirBouclier ObjetPeutAvoirReacteur Detectable Explose)
        (
         (privé r0)
         (privé r1)
         (privé angle)
         (privé joueur)
         (privé geoBase)
         (privé pause)
         (privé dernierCôté)
         (privé dernierLancer)
         )
        (
         (publique rayonBouclier (self)
                   (* 1.2 (+ (ask self 'getSlot 'r0) (ask self 'getSlot 'r1))))
         
         (publique angleAvion (self)
                   (ask self 'getSlot 'angle))
         
         (publique Gobelin (self x y joueur affichage moteur)
                   (ask self 'Dessin  affichage moteur)
                   (ask self 'setSlot 'x x)
                   (ask self 'setSlot 'y y)
                   (ask self 'setSlot 'pause (current-milliseconds))
                   (ask self 'setSlot 'reacteur (new 'Reacteur self (make-rgb 0 0 1)))
                   (ask self 'setSlot 'dernierLancer (current-seconds))
                   (ask self 'setSlot 'dernierCôté 'gauche)
                   (ask self 'setSlot 'points 300)
                   (ask self 'setSlot 'vie 30)
                   (ask self 'setSlot 'geoBase (new 'GeometrieDeBase))
                   (ask self 'setSlot 'joueur joueur)
                   (ask self 'setSlot 'r0 (+ 10 (random 20)))
                   
                   (ask self 'setSlot 'r1 (+ 5 (random 3)))
                   (ask self 'setSlot 'angle (random 2))
                   (ask self 'setSlot 'geo (new 'GeometrieCercle x y (ask self 'getSlot 'r0)))
                   (ask self 'ajouterBouclier (make-rgb 0.9 0.1 0.2) (random 26))
                   )
         
         (publique dessiner (self canevas)
                   (let* ((x (ask self 'getSlot 'x))
                          (y (ask self 'getSlot 'y))
                          (r0 (ask self 'getSlot 'r0))
                          (r1 (ask self 'getSlot 'r1))
                          (angle (ask self 'getSlot 'angle))
                          (angle1 (- angle (/ pi 2)))
                          (angle2 (+ angle (/ pi 2)))
                          (angle20 (- angle (/ pi 1.2)))
                          (angle30 (+ angle (/ pi 1.2)))
                          (x2 (+ x (* r0 (cos angle1))))
                          (y2 (+ y (* -1 r0 (sin angle1))))
                          (x20 (+ x (* r0 (cos angle20))))
                          (y20 (+ y (* -1 r0 (sin angle20))))
                          (x4 (+ x (* r0 (cos angle))))
                          (joueur (ask self 'getSlot 'joueur))
                          (x1 (ask joueur 'getSlot 'x))
                          (y1 (ask joueur 'getSlot 'y))
                          (geo (ask self 'getSlot 'geoBase))
                          (dis (ask geo 'distance x y x1 y1))
                          (y4 (+ y (* -1 r0 (sin angle))))
                          (x30 (+ x (* r0 (cos angle30))))
                          (y30 (+ y (* -1 r0 (sin angle30))))
                          (x3 (+ x (* r0 (cos angle2))))
                          (y3 (+ y (* -1 r0 (sin angle2)))))
                     (ask canevas 'cercle-plein x y r0 (make-rgb 0.2 0.8 0.1))
                     (ask canevas 'dessinerBoule x2 y2 r1 angle1 1 0.3 0.3)
                     (ask canevas 'dessinerBoule x3 y3 r1 angle2 1 0.7 0.3)
                     (ask canevas 'dessinerBoule x20 y20 r1 angle1 1 0.3 0.3)
                     (ask canevas 'dessinerBoule x30 y30 r1 angle2 1 0.7 0.3)
                     (ask canevas 'ligne x y x4 y4 (make-rgb 0.6 0.3 0.1))
                     (if (not (< dis 160))
                         (ask self 'dessinerRéacteur canevas))
                     ))
         
         (privé tirerBoules (self)
                (if (> (- (current-seconds) (ask self 'getSlot 'dernierLancer)) 3)
                    (let*  ( (x0 (ask self 'getSlot 'x))
                             (y0 (ask self 'getSlot 'y))
                             (r0 (ask self 'getSlot 'r0))
                             (angle (ask self 'getSlot 'angle))
                             (angle1 (- angle (/ pi 2)))
                             (angle2 (+ angle (/ pi 2)))
                             (x2 (+ x0 (* (+ 30 r0) (cos angle1))))
                             (y2 (+ y0 (* (+ 30 r0) (- (sin angle1)))))
                             (x3 (+ x0 (* (+ 30 r0) (cos angle2))))
                             (y3 (+ y0 (* (+ 30 r0) (- (sin angle2)))))
                             (joueur (ask self 'getSlot 'joueur))
                             (x1 (ask joueur 'getSlot 'x))
                             (y1 (ask joueur 'getSlot 'y))
                             (geo (ask self 'getSlot 'geoBase))
                             (angle-2 (ask geo 'angle x2 y2 x1 y1))
                             (angle-3 (ask geo 'angle x3 y3 x1 y1))
                             )
                      (new 'BouleMagique x2 y2 angle-2 self (ask self 'getSlot 'affichage) (ask self 'getSlot 'moteur))
                      (new 'BouleMagique x3 y3 angle-3 self (ask self 'getSlot 'affichage) (ask self 'getSlot 'moteur))
                      (ask self 'setSlot 'dernierLancer (current-seconds))
                      )))
         
         (privé détecterCollision (self)
                (let ((collision 
                       (ask (ask self 'getSlot 'moteur) 'collisionAvecCercle (ask self 'obtenirGeometrie)))) 
                  (if (not (null? collision))
                      (let ((objet (ask collision 'objet)))
                        (if (not (equal? (ask objet 'proprio) self))
                            (begin
                              ;(print (ask objet 'proprio))(newline)
                              (ask self 'setSlot 'pause (current-milliseconds)))
                            )))))
         
         (publique vivre (self)
                  ; (print (format "~s ~s" (- (current-milliseconds) (ask self 'getSlot 'pause)) 1))(newline)
                   (if (> (- (current-milliseconds) (ask self 'getSlot 'pause)) (+ 2000 (random 10000)))
                       (begin (let* ((joueur (ask self 'getSlot 'joueur))
                                     (gobelin self)
                                     (x0 (ask gobelin 'getSlot 'x))
                                     (y0 (ask gobelin 'getSlot 'y))
                                     (r0 (ask self 'getSlot 'r0))
                                     (r1 (ask self 'getSlot 'r1))
                                     (x1 (ask joueur 'getSlot 'x))
                                     (y1 (ask joueur 'getSlot 'y))
                                     (geo (ask gobelin 'getSlot 'geoBase))
                                     (angleV (ask geo 'angle x0 y0 x1 y1))
                                     (dis (ask geo 'distance x0 y0 x1 y1)))
                                (ask self 'setSlot 'angle angleV)
                                (if (< dis 160)
                                    (ask self 'tirerBoules)
                                    (let* ((v 1)
                                           (dx (* v (cos angleV)))
                                           (dy (* -1 v (sin angleV))))
                                      (ask self 'additionnerAttribut 'x dx)
                                      (ask (ask self 'obtenirGeometrie) 'additionnerAttribut 'x dx)
                                      (ask self 'additionnerAttribut 'y dy)
                                      (ask (ask self 'obtenirGeometrie) 'additionnerAttribut 'y dy))))
                              (ask self 'détecterCollision))
                       ))
         
         ))