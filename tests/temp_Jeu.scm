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


(load "langage-objet.scm")

; @author Sébastien
(define (Jeu_Jeu self)
  (let ((moteur (new 'MoteurCollisions))
        (affichage (new 'TamponDouble))
        (lar 800)
        (hau 600))
    (ask moteur 'MoteurCollisions 25)
    (ask self 'setSlot 'moteur moteur)
    (ask self 'setSlot 'affichage affichage)
    (ask affichage 'TamponDouble 20 lar hau)
    (let ((sol (new 'DessinRectangle)))
      ;(ask sol 'DessinRectangle 10 10 10 15 (- lar 10) 15 (- lar 10) 10)
      ; Remplacer ligne si dessous, test de GAP dans la bordure
      (ask sol 'DessinRectangle 100 10 100 15 (- lar 10) 15 (- lar 10) 10)
      (ask sol 'enregistrerMoteur moteur)
      (ask (ask self 'getSlot 'affichage) 'ajouter sol))
    (let ((sol3 (new 'DessinRectangle)))
      (ask sol3 'DessinRectangle 10 (- hau 10) 10 (- hau 5) (- lar 10) (- hau 5)
           (- lar 10) (- hau 10))
      (ask sol3 'enregistrerMoteur moteur)
      (ask (ask self 'getSlot 'affichage) 'ajouter sol3))
    (let ((sol4 (new 'DessinRectangle)))
      (ask sol4 'DessinRectangle 10 15 15 15 15 (- hau 10) 10 (- hau 10))
      (ask sol4 'enregistrerMoteur moteur)
      (ask (ask self 'getSlot 'affichage) 'ajouter sol4))
    (let ((sol2 (new 'DessinRectangle)))
      (ask sol2 'DessinRectangle (- lar 10) 15 (- lar 5) 15 (- lar 5) (- hau 10) (- lar 10) (- hau 10))
      (ask sol2 'enregistrerMoteur moteur)
      (ask (ask self 'getSlot 'affichage) 'ajouter sol2))
    ; Test d'un polygone
    (let ((poly1 (new 'DessinPolygone)))
      (ask poly1 'DessinPolygone 375 275 375 225 425 225 425 275 475 275 475 325 425 325 425 375 375 375 375 325 325 325 325 275)
      (ask poly1 'enregistrerMoteur moteur)
      (ask (ask self 'getSlot 'affichage) 'ajouter poly1))
    (ask self 'ajouterJoueur)
    ))

; @author Sébastien
(define (Jeu_ajouterJoueur self)
  (let ((joueur (new 'AvionJoueur))
        (viewPort (ask (ask (ask self 'getSlot 'affichage) 'getSlot 'can) 'getSlot 'viewPort)))
    (ask joueur 'AvionJoueur viewPort)
    (ask joueur 'enregistrerMoteur (ask self 'getSlot 'moteur))
    (ask joueur 'enregistrerAffichage (ask self 'getSlot 'affichage))))

; @author Sébastien
(define (Jeu_commencer self)
  (define (creer-balles i n)
    (if (< i n)
        (let ((prop (new 'Balle))
              (x (+ 50 (random 300)))
              (y (+ 30 (random 305)))
              (r (+ 5 (random 20)))
              (v (+ 2 (random 4))))
          (ask prop 'Balle x y r v)
          (ask prop 'enregistrerMoteur (ask self 'getSlot 'moteur))
          (ask prop 'enregistrerAffichage (ask self 'getSlot 'affichage))
          (sleep 1)
          (creer-balles (+ i 1) n))))
  (define (creer-balles2)
    (creer-balles 0 10))
  (thread-resume (thread creer-balles2))
  (thread-resume (thread (ask (ask self 'getSlot 'affichage) 'aller-THREAD))))

; @author Sébastien
(define temp_Jeu (creer-classe 'temp_Jeu 'Objet null
                          (list
                           (cons 'commencer Jeu_commencer)
                           (cons 'ajouterJoueur Jeu_ajouterJoueur)
                           (cons 'Jeu Jeu_Jeu))))
