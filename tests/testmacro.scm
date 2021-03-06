(define (charger-fichier fichier)
  (load (string-append "../" fichier)))

(define pi 3.141592653589793)

(require (lib "graphics.ss" "graphics"))
(require (lib "compat.ss"))

(charger-fichier "jeu/langage/macro.scm")
(charger-fichier "jeu/langage/langage-objet.scm")


; @author Sébastien
(classe Jeu hérite Objet 
        null
        (
         
         (publique 'commencer ()
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
                 (thread-resume (thread (ask (ask self 'getSlot 'affichage) 'aller-THREAD)))
                 (thread-resume (thread (ask (ask self 'getSlot 'moteur) 'aller-THREAD))))
         
         (publique 'ajouterJoueur ()
                 (let ((joueur (new 'AvionJoueur))
                       (viewPort (ask (ask (ask self 'getSlot 'affichage) 'getSlot 'can) 'getSlot 'viewPort)))
                   (ask joueur 'AvionJoueur viewPort (ask self 'getSlot 'freq))
                   (ask joueur 'enregistrerMoteur (ask self 'getSlot 'moteur))
                   (ask joueur 'enregistrerAffichage (ask self 'getSlot 'affichage))
                   (thread-resume (thread (ask joueur 'clavier-THREAD)))))
         
         (publique 'Jeu ()
                 (let ((moteur (new 'MoteurCollisions))
                       (affichage (new 'TamponDouble))
                       (lar 800)
                       (freq 30)
                       (hau 600))
                   (ask self 'setSlot 'freq freq)
                   (ask moteur 'MoteurCollisions freq)
                   (ask self 'setSlot 'moteur moteur)
                   (ask self 'setSlot 'affichage affichage)
                   (ask affichage 'TamponDouble freq lar hau)
                   (let ((sol (new 'DessinRectangle)))
                     (ask sol 'DessinRectangle 10 10 10 15 (- lar 10) 15 (- lar 10) 10)
                     (ask sol 'enregistrerMoteur moteur)
                     (ask sol 'enregistrerAffichage (ask self 'getSlot 'affichage)))
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
                   (let ((poly1 (new 'DessinPolygone)))
                     (ask poly1 'DessinPolygone 400 300 '(375 275 375 225 425 225 425 275 475 275 475 325 425 325 425 375 375 375 375 325 325 325 325 275))
                     (ask poly1 'enregistrerMoteur moteur)
                     (ask poly1 'enregistrerAffichage (ask self 'getSlot 'affichage)))
                   (let ((poly1 (new 'DessinPolygone)))
                     (ask poly1 'DessinPolygone 200 300 '(175 275 175 225 225 225 225 275 275 275 275 325 225 325 225 375 175 375 175 325 125 325 125 275))
                     (ask poly1 'enregistrerMoteur moteur)
                     (ask poly1 'enregistrerAffichage (ask self 'getSlot 'affichage)))
                   (ask self 'ajouterJoueur)
                   (ask self 'commencer)
                   ))))
