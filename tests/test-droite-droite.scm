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

(define f (new 'GeometriePolygone))
(ask f 'GeometriePolygone '())
(ask f 'droite-Droite 1 2 2 1 1 1 2 2)

(ask f 'droite-Droite 1 1 2 1 1 1 2 2)
(ask f 'droite-Droite 1 1 1 4 1 1 2 2)

(define p2 (new 'GeometriePolygone))
(ask p2 'GeometriePolygone '(375 275 375 225 425 225 425 275 475 275 475 325 425 325 425 375 375 375 375 325 325 325 325 275))

(define c2 (new 'GeometrieCercle))
(ask c2 'GeometrieCercle 375 100 20)
(ask p2 'collisionAvecCercle c2)