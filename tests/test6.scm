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

(define affichage (new 'TamponDouble))
(ask affichage 'TamponDouble 35)

(define prop (new 'Balle))
(ask prop 'Balle 400 100 10 3)
(ask prop 'enregistrerMoteur moteur)
(ask affichage 'ajouter prop)
(thread-resume (thread (ask prop 'chute_lambda)))

(define prop2 (new 'Balle))
(ask prop2 'Balle 400 500 20 0)
(ask prop2 'enregistrerMoteur moteur)
(ask affichage 'ajouter prop2)
(thread-resume (thread (ask prop2 'chute_lambda)))



(ask affichage 'aller)