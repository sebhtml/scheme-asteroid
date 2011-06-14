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

(define (charger-fichier fichier)
  (load (string-append "../" fichier)))

(define pi 3.141592653589793)

(require (lib "graphics.ss" "graphics"))
(require (lib "compat.ss"))

(charger-fichier "jeu/langage/langage-objet.scm")
(charger-fichier "jeu/langage/Classe.scm")
(charger-fichier "jeu/langage/TableDispersion.scm")
(charger-fichier "jeu/langage/Objet.scm")
(charger-fichier "jeu/langage/Processus.scm")

(charger-fichier "jeu/physique/MoteurCollisions.scm")
(charger-fichier "jeu/physique/CollisionVectorielle.scm")

(charger-fichier "jeu/geometrie/GeometrieCercle.scm")
(charger-fichier "jeu/geometrie/GeometrieDeBase.scm")
(charger-fichier "jeu/geometrie/GeometrieRectangle.scm")
(charger-fichier "jeu/geometrie/GeometriePolygone.scm")

(charger-fichier "jeu/affichage/Canevas.scm")
(charger-fichier "jeu/affichage/TamponDouble.scm")

(charger-fichier "jeu/dessin/Dessin.scm")
(charger-fichier "jeu/dessin/DessinRectangle.scm")
(charger-fichier "jeu/dessin/DessinPolygone.scm")
(charger-fichier "jeu/dessin/DessinCercle.scm")

(charger-fichier "jeu/dessin/Balle.scm")

(charger-fichier "jeu/avion/AvionJoueur.scm")
(charger-fichier "jeu/Jeu.scm")

(define poly (new 'GeometriePolygone))

(define affichage (new 'TamponDouble))
(ask affichage 'TamponDouble 32 800 600)

(ask poly 'GeometriePolygone (list 30 30 40 48 20 48))
(define dessin-poly (new 'DessinPolygone))
(ask dessin-poly 'DessinPolygone 30 30 40 48 20 48)
;(ask dessin-poly 'enregistrerAffichage affichage)

(define cer (new 'GeometrieCercle))
(ask cer 'GeometrieCercle 20 30 10)
(define cer2 (new 'GeometrieCercle))
(ask cer2 'GeometrieCercle 30 20 10)

(print "droite 30 20 10    et   30 30 40 48")(newline)
(ask cer2 'contientDroite 30 30 40 48)
(define dessin-poly2 (new 'DessinPolygone))
(ask dessin-poly2 'DessinPolygone 30 30 40 48)
(ask dessin-poly2 'enregistrerAffichage affichage)

(define cer3 (new 'GeometrieCercle))
(ask cer3 'GeometrieCercle 30 20 28)

(display "Donne environ 27 34")(newline)
(ask poly 'collisionAvecCercle cer)
(define cerD (new 'DessinCercle))

(ask cerD 'DessinCercle 30 20 10)
(ask cerD 'enregistrerAffichage affichage)

(display "Donne 30 30") (newline)
(ask poly 'collisionAvecCercle cer2)
(display "Probleme ici, le cercle entre en contact avec la base du triangle(30 48) et non sa pointe")(newline)
(ask poly 'collisionAvecCercle cer3)




;;;;;;;;;;;
(define pol2 (new 'GeometriePolygone))

(ask pol2 'GeometriePolygone (list 59 50 70 50 70 80))

(define cer4 (new 'GeometrieCercle))
(ask cer4 'GeometrieCercle 50 50 10)


(define dessinCercle (new 'DessinCercle))
(ask dessinCercle 'DessinCercle 50 50 10)
;(ask dessinCercle 'enregistrerAffichage affichage)
(define dessin2 (new 'DessinRectangle))
(ask dessin2 'DessinRectangle 51 0 50 100 50 0 50 100)
;(ask dessin2 'enregistrerAffichage affichage)
(thread-resume (thread (ask affichage 'aller-THREAD)))
  
(print "yo")(newline)
;(ask cer4 'contientDroite 59 50 70 50)
(ask cer4 'contientDroite 51 0 50 100)
(ask pol2 'collisionAvecCercle cer4)
