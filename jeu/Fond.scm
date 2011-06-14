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



(classe Fond
        ()
        
        (
         
         (publique Fond (self)
                   #f)
         
         (publique dessiner (self canevas)
                   (ask canevas 'poly-plein '(0 0 800 0 800 600 0 600) (make-rgb 0 0 0))
                   (ask self 'fractale canevas))
         
         (privé fractale (self canevas)
                (define (iter x y r i)
                  (if (> i 0)
                      (begin
                        (ask canevas 'dessinerBoule x y r pi 0.8 0.8 0.8)
                        (iter (/ x 1.2) (/ y 1.3) (/ r 1.3) (- i 1)))))
                (iter 700 500 50 8)
                (iter 400 300 40 2)
                (iter 500 100 10 4))
                ))