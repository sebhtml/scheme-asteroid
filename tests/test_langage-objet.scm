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

(load "Objet.scm")
(load "Classe.scm")

(define (Animal_respirer self)
  (print (slot-value self 'volumeCerveau))(newline))

(define (Animal_volumeCerveau self)
  (slot-value self 'volumeCerveau))

(creer-classe 'Animal 'Objet (list 'age 'volumeCerveau) (list (cons 'respirer Animal_respirer)
                                                            (cons 'volumeCerveau Animal_volumeCerveau)))

(define homme (new 'Animal (cons 'age 99) (cons 'volumeCerveau 2)))
homme

;(cdr homme)

;(assq 'a '((a 1) (b 2) (c 3)))
(get-method homme 'respirer)

(ask homme 'volumeCerveau)

(ask homme 'respirer)

(define (Poisson_nager self)
  (print "je nage")(newline))

(define a (cons 2 3))

a
(define b (car a))
(set! b 9)

a


(define (Poisson_nombreEcailles= self val)
  (let ((a (slot-value self 'nombreEcailles)))
  (set! a val)))

(define (Poisson_construire self nombreEcailles age volumeCerveau)
  1)

(define (Poisson_nombreEcailles self)
  (slot-value self 'nombreEcailles))

(define Poisson (creer-classe 'Poisson 'Animal '(nombreEcailles) (list (cons 'nager Poisson_nager)
                                                       (cons 'nombreEcailles= Poisson_nombreEcailles=)
                                                       (cons 'construire Poisson_construire)
                                                       (cons 'nombreEcailles Poisson_nombreEcailles))))

(define Poisson (new 'Classe))
(ask Poisson 'setSlot 'nombrePoissons 5)
(slot-value Poisson 'nombrePoissons)

67898765678
 (ask Poisson 'classe)
Poisson
(add-methode (ask Poisson 'classe) 'nombrePoissons (lambda (self) (slot-value self 'nombrePoissons)))

98765
(ask Poisson 'nombrePoissons)

(ask Poisson 'setSlot 'nombrePoissons 45678)


(ask Poisson 'nombrePoissons)
(define hercule (new 'Poisson (cons 'nombreEcailles 99)))
(ask hercule 'construire 5 5 6)
(ask hercule 'nombreEcailles= 9999)
(ask hercule 'nombreEcailles)
hercule

(ask hercule 'setSlot 'nombreEcailles 992)
(ask hercule 'setSlot 'muche hercule)
hercule

(define a (cons 1 2))

(define b (cons a a))

(set-car! b 1)
b

(ask hercule 'classe)

(print "------------_")
(newline)

(define Reptile (creer-classe 'Reptile 'Objet (list 'temp) (list)))

(define rep (new 'Reptile (cons 'temp 0)))

(ask rep 'temp)
