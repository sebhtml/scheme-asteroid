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

; @author Sébastien

(define (charger-fichier fichier)
  (load (string-append "../" fichier)))

(require (lib "compat.ss"))

(charger-fichier "jeu/langage/langage-objet.scm")
(charger-fichier "jeu/langage/Objet.scm")
(charger-fichier "jeu/langage/TableDispersion.scm")
(charger-fichier "tests/assert.scm")

(define table (new 'TableDispersion))
(ask table 'TableDispersion)

(ask table 'mettre 2 3)
(ask table 'mettre 3 4)
(assertion-Egaux 3 (ask table 'obtenir 2) "1")
(ask table 'mettre 2 6)
(assertion-Egaux 6 (ask table 'obtenir 2) "2")
(ask table 'enlever 3)
(assertion-Egaux null (ask table 'obtenir 3) "3")

(define table2 (new 'TableDispersion))
(ask table2 'TableDispersion)
(ask table2 'mettre 2 3)
(ask table2 'mettre 22 31)
(ask table2 'mettre 23 32)
(ask table2 'mettre 23 323)
(ask table2 'mettre 24 33)
(ask table2 'mettre 25 33)

(assertion-Egaux '(33 31 33 3 323) (ask table2 'valeurs) "vals")