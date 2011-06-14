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
(load "GeometrieDeBase.scm")
(load "GeometrieCercle.scm")
(load "Objet.scm")
(load "Classe.scm")

(define geo (new 'GeometrieCercle))
(ask geo 'GeometrieCercle 60 60 10)
(ask geo 'x)
(ask geo 'y)
(ask geo 'r)
(ask geo 'contient 60 60)


(print "fetching setSlot")(newline)
(get-method geo 'setSlot)

(ask geo 'GeometrieCercle 60 60 10)
(ask geo 'contient 60 60)






(define geo2 (new 'GeometrieCercle))
(ask geo2 'GeometrieCercle 65 65 10)
(define geo3 (new 'GeometrieCercle))
(ask geo3 'GeometrieCercle 80 80 2)
 
(equal? geo2 geo2)
(define geo4 geo2)

(ask geo2 'collisionAvecCercle geo2)
(ask geo2 'collisionAvecCercle geo)
(ask geo2 'collisionAvecCercle geo3)
(equal? geo4 geo2)

(define c1 (new 'GeometrieCercle))
(define c2 (new 'GeometrieCercle))
(ask c1 'GeometrieCercle 20 20 4)
(ask c2 'GeometrieCercle 20 40 4)
(ask c1 'collisionAvecCercle c2)

(ask c1 'contientDroite 15 22 25 22)