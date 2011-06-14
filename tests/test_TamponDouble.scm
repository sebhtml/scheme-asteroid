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
(ask affichage 'TamponDouble 25)

(define (creer-balles i n)
  (if (< i n)
      (let ((prop (new 'Balle))
            (x (+ 50 (random 500)))
            (y (- 200 (random 35)))
            (r (+ 40 (random 50)))
            (v (+ 2 (random 4)))
            (s (/ (+ 3 (random 7)) 30.0)))
        (ask prop 'Balle x y r v s)
        (ask affichage 'ajouter prop)
        (thread-resume (thread (ask prop 'chute_lambda)))        
        (creer-balles (+ i 1) n))))

(creer-balles 0 100)

(ask affichage 'aller)