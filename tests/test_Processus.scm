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
(load "Objet.scm")
(load "Processus.scm")

(define (fib i)
  (if (or (= i 0) (= i 1)) i
      (+ (fib (- i 1)) (fib (- i 2)))))

(define (tache)
  (print (fib 28))(newline))

(tache)

(define pro (new 'Processus))
(ask pro 'Processus tache)
(ask pro 'courir)
(ask pro 'courir)
(ask pro 'courir)