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
(classe AvionJoueur hérite (Dessin Vivant ObjetPeutAvoirBouclier ObjetPeutAvoirReacteur)
        (
         (privé lasers)
         (privé missiles)
         (privé durée)
         (privé angleDirection)
         (privé angleAvion)
         (privé rayon)
	(privé réacteur)
         (privé vitesse)
         (privé dernierTir)
         (privé carburant)
         (privé geoDeBase)
         (privé viewPort)
         )
        (
         
         (publique ajouterMissiles (self v)
                   (ask self 'additionnerAttribut 'missiles v))
         
         (publique ajouterLasers (self v)
                   (ask self 'additionnerAttribut 'lasers v))
         
         (publique ajouterVie (self v)
                   (ask self 'additionnerAttribut 'vie v))
         
         (publique ajouterBouclierVie (self v)
                   (ask (ask self 'getSlot 'bouclier) 'additionnerAttribut 'vie v))
         
         (privé maxRéacteur (self)
                200)
         
         (privé angleAvion (self)
                (ask self 'getSlot 'angleAvion))
         
         (privé angleDirection (self)
                (ask self 'getSlot 'angleDirection))
         
         (privé angleDegrés (self)
                (let ((rep (inexact->exact (floor (* 180 (/ (ask self 'angleAvion) pi))))))
                  ;(print (format "~s -> ~s" (ask self 'angleAvion) rep))(newline)
                  rep))
         
         (publique rayonBouclier (self)
                   (* 1.8 (ask self 'getSlot 'rayon)))
                 
         (publique AvionJoueur (self viewPort freq affichage moteur)
                   (ask self 'setSlot 'x 300)
                   (ask self 'setSlot 'y 300)
                   (ask self 'setSlot 'vie 100)
                   (ask self 'setSlot 'mort #f)
                   (ask self 'setSlot 'reacteur (new 'Reacteur self (make-rgb 0.3 0.3 0.8)))
                   (ask self 'setSlot 'missiles 5)
                   (ask self 'setSlot 'dernierTir (current-milliseconds))
                   (ask self 'setSlot 'durée (/ 0.6 freq))
                   (ask self 'setSlot 'angleDirection (/ pi 2))
                   (ask self 'setSlot 'angleAvion (/ pi 2))
                   (ask self 'setSlot 'rayon 20)
                   (ask self 'setSlot 'carburant 200)
                   (ask self 'setSlot 'lasers 16)
                   (ask self 'setSlot 'points 0)
                   (ask self 'Dessin affichage moteur)
                   (ask self 'setSlot 'geoDeBase (new 'GeometrieDeBase))
                   (ask self 'setSlot 'vitesse 0)
                   (ask self 'setSlot 'réacteur 0)
                   (ask self 'ajouterBouclier (make-rgb 0.1 0.9 0.2) 120)
                   (let ((geometrie (new 'GeometrieCercle (ask self 'getSlot 'x)
                                         (ask self 'getSlot 'y)
                                         (ask self 'getSlot 'rayon)))
                         )
                     (ask self 'setSlot 'geo geometrie)
                     (ask self 'setSlot 'viewPort viewPort)
         ))

         (privé changerAngleAvion (self angle)
                (cond ((< angle 0) (ask self 'setSlot 'angleAvion (+ (* 2 pi) angle)))
                      ((> angle (* 2 pi)) (ask self 'setSlot 'angleAvion (- angle (* 2 pi))))
                      (else (ask self 'setSlot 'angleAvion (+ (* 0 pi) angle)))))
         
         (privé changerAngleDirection (self angle)
                (cond ((< angle 0) (ask self 'setSlot 'angleDirection (+ (* 2 pi) angle)))
                      ((> angle (* 2 pi)) (ask self 'setSlot 'angleDirection (- angle (* 2 pi))))
                      (else (ask self 'setSlot 'angleDirection (+ (* 0 pi) angle)))))
         
         (publique traiterAction (self value)
                   ;  (print value)(newline)
                   (cond ((eq? value 'up) (ask self 'changerRéacteur 2))
                         ((eq? value 'left) (ask self 'changerAngleAvion (+ (ask self 'angleAvion) 
                                                                            (ask self 'tour))))
                         ((eq? value 'right) (ask self 'changerAngleAvion (- (ask self 'angleAvion) 
                                                                             (ask self 'tour))))
                         ((eq? value '#\space) (ask self 'tirer))
                         ((eq? value '#\m) (ask self 'tirerMissile))
                         
                         (else                    (ask self 'changerRéacteur 0))
                         ))
         
         (publique tirerMissile (self)
                   (if (and (> (ask self 'getSlot 'missiles) 0) 
                            (> (- (current-milliseconds) (ask self 'getSlot 'dernierTir)) 400))
                       (begin 
                         (ask self 'additionnerAttribut 'missiles -1)
                         (ask self 'setSlot 'dernierTir (current-milliseconds))
                         (let* ((x (ask self 'getSlot 'x))
                                (y (ask self 'getSlot 'y))
                                (angle (ask self 'angleAvion))
                                (x2 (+ x (* 50 (cos angle))))
                                (y2 (+ y (* 50 (* -1 (sin angle)))))
                                (téta (ask self 'getSlot 'angleAvion))
                                (arme (new 'MissileGuide x2 y2 téta self (ask self 'getSlot 'affichage) (ask self 'getSlot 'moteur) (ask self 'getSlot 'vitesse))))
                           #f
                           ))))
         
         (publique tirer (self)
                   (if (and (> (ask self 'getSlot 'lasers) 0) 
                            (> (- (current-milliseconds) (ask self 'getSlot 'dernierTir)) 400))
                       (begin 
                         (ask self 'additionnerAttribut 'lasers -1)
                         (ask self 'setSlot 'dernierTir (current-milliseconds))
                         (let* ((x (ask self 'getSlot 'x))
                                (y (ask self 'getSlot 'y))
                                (angle (ask self 'angleAvion))
                                (x2 (+ x (* 30 (cos angle))))
                                (y2 (+ y (* 30 (* -1 (sin angle)))))
                                (téta (ask self 'getSlot 'angleAvion))
                                (arme (new 'Laser x2 y2 téta self)))
                           (ask arme 'enregistrerAffichage (ask self 'getSlot 'affichage))
                           (ask arme 'enregistrerMoteur (ask self 'getSlot 'moteur))
                           ))))
         
         (publique tour (self)
                   (/ pi 20))
         
         (publique lireClavier (self)
                   (let* ((key (ready-key-press (ask self 'getSlot 'viewPort)))
                          (value (if key (key-value key) #f)))
                     (if value
                         (ask self 'traiterAction value)))
                   (sleep (ask self 'getSlot 'durée))
                   (ask self 'lireClavier))
         
         (publique clavier-THREAD (self)
                   (lambda () (ask self 'lireClavier)))
         
         (publique changerVitesse (self v)
                   (cond ((< v 0.01) (ask self 'setSlot 'vitesse 0))
                         ((< v 5) (ask self 'setSlot 'vitesse v))))
         
         (publique changerRéacteur (self v)
                   (if (> (ask self 'getSlot 'carburant) 0)
                       (cond ((< v 0.01) (ask self 'setSlot 'réacteur 0))
                             ((< v 3) (ask self 'setSlot 'réacteur v)))
                       
                       ))
         
         (privé pad0 (self pad2)
                (define (iter chaine)
                  (if (= (string-length chaine)  4)
                      chaine
                      (iter (string-append "0" chaine))))
                (iter (format "~s" (inexact->exact pad2))))
         
         
         (publique dessiner (self canevas)
                   ; (print (format "avion: ~s, direction: ~s" (ask self 'angleAvion) (ask self 'angleDirection)))(newline)
                   (let* ((x1 (ask self 'getSlot 'x))
                          (y1 (ask self 'getSlot 'y))
                          (angle (ask self 'angleAvion))
                          (rayon (ask self 'getSlot 'rayon))
                          (x2 (+ x1 (* 60 (ask self 'getSlot 'réacteur) (cos angle))))
                          (y2 (+ y1 (* 60 (ask self 'getSlot 'réacteur) (* -1 (sin angle)))))
                          (x3 (+ x1 (* 60 (ask self 'getSlot 'vitesse) (cos (ask self 'angleDirection)))))
                          (y3 (+ y1 (* 60 (ask self 'getSlot 'vitesse) (* -1 (sin (ask self 'angleDirection))))))
                          (x4 (+ x1 (* 60 (cos angle))))
                          
                          (y4 (+ y1 (* 60 (* -1 (sin angle)))))
                          (h 21))
                     
                     
                     ;(ask canevas 'cercle-plein x1 y1 rayon (make-rgb 0.5 0.5 0.9))
                     ;(ask canevas 'ligne x1 y1 x2 y2 #f)
                     ;(ask canevas 'ligne x1 y1 x2 y2 #f)
                     (ask canevas 'poly-angle (list (- x1 10) (- y1 5) (+ x1 10) (- y1 5) x1 (+ y1 20)) (make-rgb 0.9 0.9 1) x1 y1 angle)
                     (ask canevas 'poly-angle (list (- x1 10) (+ y1 5) (+ x1 10) (+ y1 5) x1 (- y1 20)) (make-rgb 0.9 0.9 1) x1 y1 angle)
                     (ask canevas 'poly-angle (list (- x1 30) (+ y1 0) (- x1 10) (+ y1 5) (- x1 10) (- y1 5)) (make-rgb 0.9 0.9 1) x1 y1 angle)
                     
                     (ask canevas 'poly-angle (ask (new 'GeometrieDeBase) 'genererPolygone x1 y1 15 6) (make-rgb 0.2 0.212 0.62) x1 y1 angle)
                     
                     ;(ask canevas 'ligne x1 y1 x3 y3 #f)
                     ; (ask canevas 'ligne x1 y1 x4 y4 #f)
                     )
                   
                   (if (> (ask self 'getSlot 'réacteur) 0)
                       (ask self 'dessinerRéacteur canevas))
                   (ask self 'dessinerInfos canevas))
         
         (privé dessinerInfos (self canevas)
                (let* ((largeur (ask canevas 'largeur))
                       (hauteur (ask canevas 'hauteur))
                       (largeur-truc 100)
                       (hauteur-truc 20)
                       (marge 5)
                       (x2 (- largeur marge))
                       (x1 (- x2 largeur-truc))
                       (y1 marge)
                       (y2 (+ y1 hauteur-truc)))
                  ; (ask canevas 'rect x1 y1 x2 y1 x2 y2 x1 y2 (make-rgb 1 0 0))
                  (ask canevas 'texte (format "Vie ~s" (ask self 'getSlot 'vie)) 320 20 (make-rgb 0 1 0))
                  (ask canevas 'texte (format "Bouclier ~s" (ask (ask self 'getSlot 'bouclier) 'getSlot 'vie)) 400 20 (make-rgb 0 1 0))
                  (ask canevas 'texte (format "Lasers ~s" (ask self 'getSlot 'lasers)) marge 20 (make-rgb 0 1 0))
                  (ask canevas 'texte (format "Missiles ~s" (ask self 'getSlot 'missiles)) 230 20 (make-rgb 0 1 0))
                  (ask canevas 'texte (format "Points ~s" (ask self 'points)) 540 20 (make-rgb 0 1 0))
                  (ask canevas 'texte (format "Carburant ~s" (ask self 'getSlot 'carburant)) 100 20 (make-rgb 0 1 0))
                  ;(ask canevas 'texte (format "haut gauche droit espace m") 540 20 (make-rgb 0 0.7654 1))
                  ))
         
         
         (publique changerX (self x)
                   (ask self 'setSlot 'x x)
                   (ask (ask self 'getSlot 'geo) 'setSlot 'x x))
         
         (publique changerY (self y)
                   (ask self 'setSlot 'y y)
                   (ask (ask self 'getSlot 'geo) 'setSlot 'y y))
         
         (privé entretenirRéacteur (self)
                (ask self 'additionnerAttribut 'carburant (* -4 (ask self 'getSlot 'réacteur)))
                (ask self 'additionnerAttribut 'carburant 1)
                (if (< (ask self 'getSlot 'carburant) 0)
                    (begin (ask self 'setSlot 'carburant 0)
                           (ask self 'setSlot 'réacteur 0)))
                (if (> (ask self 'getSlot 'carburant) (ask self 'maxRéacteur))
                    (ask self 'setSlot 'carburant (ask self 'maxRéacteur)))
                )
         
         (privé detecterCollision (self)
                (define (iter valeurs)
                  (if (not (null? valeurs))
                      (begin
                        
                        (let* ((collision (car valeurs))
                               (point (ask collision 'point))
                               (objet (ask collision 'objet)))
                          (if (not (equal? self (ask objet 'proprio)))
                              (let* ((geo (ask self 'getSlot 'geoDeBase))
                                     (beta (ask geo 'angle
                                                (car point)
                                                (cdr point)
                                                (ask self 'x)
                                                (ask self 'y)))
                                     (theta (ask self 'angleDirection))
                                     (nouvelAngle (+ theta pi (* 2 (- beta theta)))))
                                (ask self 'changerAngleDirection nouvelAngle)
                                (ask self 'changerAngleAvion nouvelAngle)
                                )))
                        (iter (cdr valeurs)))))
                (let ((collisions 
                       (ask (ask self 'getSlot 'moteur) 'collisionsAvecCercle (ask self 'obtenirGeometrie)))) 
                  (iter collisions)))
         
         (publique mourir (self)
                   (new 'PartieTermine (ask self 'getSlot 'points) (ask self 'getSlot 'affichage) (ask self 'getSlot 'moteur)))
         
         (publique vivre (self)
                   ;                   (print "angle -> ")(print (ask self 'angle))(newline)
                   (ask self 'changerVitesse (/ (ask self 'getSlot 'vitesse) 1.01))
                   (ask self 'entretenirRéacteur)
                   ;(print (format "Réacteur est ~s" (ask self 'getSlot 'réacteur)))(newline)
                   
                   (let* ((vitesse_x (* (ask self 'getSlot 'vitesse) (cos (ask self 'angleDirection))))
                          (vitesse_y (* (ask self 'getSlot 'vitesse) (* -1 (sin (ask self 'angleDirection)))))
                          (moteur_x (* (ask self 'getSlot 'réacteur) (cos (ask self 'angleAvion))))
                          (moteur_y (* (ask self 'getSlot 'réacteur) (* -1 (sin (ask self 'angleAvion)))))
                          (nouvelleVitesseX (+ vitesse_x moteur_x))
                          (nouvelleVitesseY (+ vitesse_y moteur_y))
                          (nouvelleVitesse (sqrt (+ (expt nouvelleVitesseX 2) (expt nouvelleVitesseY 2))))
                          (nouvelleDirection2 
                           (atan (/ (* -1 nouvelleVitesseY) (+ 0.000000001 nouvelleVitesseX))))
                          (nouvelleDirection (cond 
                                               ((and (< (* -1 nouvelleVitesseY) 0) (< nouvelleVitesseX 0))
                                                (+ nouvelleDirection2 pi))
                                               ((and (> (* -1 nouvelleVitesseY) 0) (< nouvelleVitesseX 0))
                                                (+ nouvelleDirection2 pi))
                                               ((< nouvelleDirection2 0)
                                                (+ nouvelleDirection2 (* 2 pi)))
                                               (else
                                                nouvelleDirection2)))
                          )
                     (ask self 'changerVitesse nouvelleVitesse)
                     (ask self 'setSlot 'angleDirection nouvelleDirection)
                     (ask self 'changerX (+ (ask self 'getSlot 'x) 
                                            nouvelleVitesseX))
                     (ask self 'changerY (+ (ask self 'getSlot 'y) 
                                            nouvelleVitesseY))
                     
                     
                     )
                   (ask self 'detecterCollision))
         
         ))
