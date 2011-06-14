(define (charger-fichier fichier)
  (load (string-append "../" fichier)))

(require (lib "compat.ss"))

(charger-fichier "jeu/langage/macro.scm")
(charger-fichier "jeu/langage/langage-objet.scm")

(classe Félin hérite null
        ((private choco))
        (
         (publique Félin (self)
                   (print "Félin créé maintenant")(newline))))

(classe Chat hérite Félin
        ((privé couleur))
        (
         (publique Chat (self)
                   (print "Chat créé maintenant")(newline))))

(classe Muche hérite null
        ((privé couleur))
        (
         (publique Muche (self yo)
                   (print "Muche créé maintenant ")(print yo)(newline))))

(new 'Chat)
(define m (new 'Muche 'yo))