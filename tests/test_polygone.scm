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

(define pi 3.141592653589793)
(require (lib "graphics.ss" "graphics"))

(load "MoteurCollisions.scm")
(load "Processus.scm")
(load "GeometrieCercle.scm")
(load "Classe.scm")
(load "TableDispersion.scm")
(load "Objet.scm")
(load "GeometrieDeBase.scm")
(load "Balle.scm")
(load "Canevas.scm")
(load "TamponDouble.scm")
(load "Dessin.scm")
(load "DessinRectangle.scm")
(load "GeometrieRectangle.scm")
(load "Jeu.scm")
(load "AvionJoueur.scm")
(load "GeometriePolygone.scm")
(load "ListeSommets.scm")
(load "DessinPolygone.scm")
(load "temp_Jeu.scm")

; @author Pier-Luc
(define jeu (new 'temp_Jeu))
(ask jeu 'Jeu)
(ask jeu 'commencer)
