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

(define moteur (new 'MoteurCollisions))
(ask moteur 'MoteurCollisions)

(define b (new 'Balle))
(ask b 'Balle 4 4 5 3 3)
(ask b 'enregistrerMoteur moteur)

(ask moteur 'collisionAvecCercle (ask b 'obtenirGeometrie))

;(ask b 'obteniGeometrie)
;(ask b 'getSlot 'moteur)
