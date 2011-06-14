

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


(charger-fichier "jeu/langage/macro.scm")
(charger-fichier "jeu/langage/langage-objet.scm")
(charger-fichier "jeu/langage/Classe.scm")
(charger-fichier "jeu/langage/TableDispersion.scm")
(charger-fichier "jeu/langage/Objet.scm")

(charger-fichier "jeu/physique/MoteurCollisions.scm")
(charger-fichier "jeu/physique/CollisionVectorielle.scm")

(charger-fichier "jeu/geometrie/GeometrieCercle.scm")
(charger-fichier "jeu/geometrie/GeometrieDeBase.scm")
(charger-fichier "jeu/geometrie/GeometrieRectangle.scm")
(charger-fichier "jeu/geometrie/GeometriePolygone.scm")

(charger-fichier "jeu/affichage/Canevas.scm")
(charger-fichier "jeu/affichage/TamponDouble.scm")

(charger-fichier "jeu/effets/Reacteur.scm")
(charger-fichier "jeu/effets/Explosion.scm")

(charger-fichier "jeu/intelligence/Mere.scm")

(charger-fichier "jeu/dessin/Dessin.scm")
(charger-fichier "jeu/dessin/DessinRectangle.scm")
(charger-fichier "jeu/dessin/DessinPolygone.scm")

(charger-fichier "jeu/armurerie/Arme.scm")
(charger-fichier "jeu/armurerie/Laser.scm")
(charger-fichier "jeu/armurerie/BouleMagique.scm")
(charger-fichier "jeu/armurerie/MissileGuide.scm")

(charger-fichier "jeu/equipement/Bouclier.scm")

(charger-fichier "jeu/mechants/Mechant.scm")
(charger-fichier "jeu/mechants/Roche.scm")
(charger-fichier "jeu/mechants/Gobelin.scm")

(charger-fichier "jeu/avion/AvionJoueur.scm")
(charger-fichier "jeu/Jeu.scm")

(classe E hérite Objet
        (
         (privé h))
        (
         (publique E (self)
              (print "E")(newline))
         ))

(classe A hérite E
   ()
   (
    (publique A (self)
              'mo)
    (publique me1 (self)
              #t)
    )
   )


(classe B
   (
    (privé a))
   (
    (publique B (self)
              ;(print "B")(newline)
              ;(ask self 'setSlot 'a 4)
             #f )
    )
   )

(classe C hérite (A B)
        (
         (privé a))
        
        (
         (publique C (self)
                  ; (print "C")(newline)
                   (ask self 'setSlot 'a 2))
         )
        )

(define l (new 'C))
;(ask l 'B)
;(ask l 'get-method 'getSlot)

;(ask l 'getSlot-cons 'a)
;(ask l 'supers)
;l

;(new 'B)
;(new 'Objet)

;(print ">>>>>>>")(newline)
;(ask l 'getSlot-cons 'h)
;(print "<<<<<<<")(newline)
;(ask l 'setSlot 'h 1)

;(ask l 'getSlot 'h)

