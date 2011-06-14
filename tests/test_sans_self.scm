(define (charger-fichier fichier)
  (load (string-append "../" fichier)))

(define pi 3.141592653589793)

(require (lib "graphics.ss" "graphics"))
(require (lib "compat.ss"))

(charger-fichier "jeu/langage/macro.scm")
(charger-fichier "jeu/langage/langage-objet.scm")





(classe Arme hérite null
        ((privé vitesse)
         (privé direction)
         (privé dommage)
         (privé proprio))
        
        (
         
         
         (publique méchant? ()
                   #t)
         
         (publique dommage ()
                   (ask self 'getSlot 'dommage))
         
         (publique Arme ()
                   #f)
         
         (publique ajouterPoints (v)
                   (ask (ask self 'proprio) 'ajouterPoints v)
                   )
         ))

;(define a (new 'Arme));
;(ask a 'ajouterPoints 4)

