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
(load "Canevas.scm")
(load "Objet.scm")

(define canevas (new 'Canevas))
(ask canevas 'Canevas "nom" 800 600)

(ask canevas 'ligne 1 20 300 800)
(ask canevas 'cercle 200 200 200)

(ask canevas 'cercle 400 300 300)

(define (fract n i x y z f canevas)
  (if (= n i)
      (ask canevas 'ligne x y z f)
      (begin
        (fract n (+ i 1) x (/ y 2) (/ z 3) (- f 5) canevas)
        (fract n (+ i 1) x (/ y 2) (/ z 3) (- f 5) canevas)
        (fract n (+ i 1) x (/ y 2) (/ z 3) (- f 5) canevas)
        ) 
      ))

(ask canevas 'rect 200 200 200 300 400 300 400 200)

(ask canevas 'poly '(200 200 210 210 240 300))
;(fract 10 0 10 10 700 500 canevas)