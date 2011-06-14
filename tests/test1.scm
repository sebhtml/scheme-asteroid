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
(load "Dessin.scm")
(load "DessinRectangle.scm")
(load "GeometrieRectangle.scm")

(define moteur (new 'MoteurCollisions))
(ask moteur 'MoteurCollisions)

(define lar 1000)
(define hau 700)

(define affichage (new 'TamponDouble))
(ask affichage 'TamponDouble 15 lar hau)

(define (creer-balles i n)
  (if (< i n)
      (let ((prop (new 'Balle))
            (x (+ 50 (random 300)))
            (y (+ 30 (random 305)))
            (r (+ 5 (random 20)))
            (v (+ 2 (random 4))))
        (ask prop 'Balle x y r v)
        (ask prop 'enregistrerMoteur moteur)
        (ask affichage 'ajouter prop)
        (thread-resume (thread (ask prop 'chute_lambda)))
        (sleep 1)
        (creer-balles (+ i 1) n))))

(define (creer-balles2)
  (creer-balles 0 6))

(thread-resume (thread creer-balles2))

(define sol (new 'DessinRectangle))
(ask sol 'DessinRectangle 10 10 10 15 (- lar 10) 15 (- lar 10) 10)
(ask sol 'enregistrerMoteur moteur)
(ask affichage 'ajouter sol)

(define sol3 (new 'DessinRectangle))
(ask sol3 'DessinRectangle 10 (- hau 10) 10 (- hau 5) (- lar 10) (- hau 5)
     (- lar 10) (- hau 10))
(ask sol3 'enregistrerMoteur moteur)
(ask affichage 'ajouter sol3)


(define sol4 (new 'DessinRectangle))
(ask sol4 'DessinRectangle 10 15 15 15 15 (- hau 10) 10 (- hau 10))
(ask sol4 'enregistrerMoteur moteur)
(ask affichage 'ajouter sol4)

(define sol2 (new 'DessinRectangle))
(ask sol2 'DessinRectangle (- lar 10) 15 (- lar 5) 15 (- lar 5) (- hau 10) (- lar 10) (- hau 10))
(ask sol2 'enregistrerMoteur moteur)
(ask affichage 'ajouter sol2)

(thread-resume (thread (ask affichage 'aller-THREAD)))

(define viewport (ask (ask affichage 'getSlot 'can) 'getSlot 'viewPort))

(key-value (get-key-press viewport))
