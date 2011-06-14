

(classe PartieTermine hérite Dessin
        ()
        
        (
         (publique collisionAvecCercle (self cercle)
                   #f)
         
         (publique PartieTermine (self points affichage moteur)
                   (ask self 'setSlot 'points points)
                   (ask self 'Dessin affichage moteur))
         
         (publique dessiner (self canevas)
                   (ask canevas 'texte (format "Partie terminée! Vous avez fait ~s points!" (ask self 'getSlot 'points)) 300 400 (make-rgb 1 0 0)))
         
         ))