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
(classe Jeu 
        (
         (privé freq)
         (privé moteur)
         (privé affichage)
         (privé mère)
         (privé joueur)
         )
        (
         
         (publique commencer (self)
                   (thread-resume (thread (ask (ask self 'getSlot 'mère) 'créerTrucs-THREAD)))
                   (thread-resume (thread (ask (ask self 'getSlot 'affichage) 'aller-THREAD)))
                   (thread-resume (thread (ask (ask self 'getSlot 'moteur) 'aller-THREAD)))
                   (thread-resume (thread (ask (ask self 'getSlot 'joueur) 'clavier-THREAD))))

         (publique ajouterJoueur (self)
                   (let* ((affichage (ask self 'getSlot 'affichage))
                          (moteur (ask self 'getSlot 'moteur))
                          (viewPort (ask (ask (ask self 'getSlot 'affichage) 'getSlot 'can) 'getSlot 'viewPort))
                          (joueur (new 'AvionJoueur viewPort (ask self 'getSlot 'freq) affichage moteur))
                          )
                     (ask self 'setSlot 'joueur joueur)
                     (ask self 'setSlot 'mère (new 'Mere joueur self))))
         
         (publique Jeu (self)
                   (let* (                         (lar 800)
                                                   (freq 50)
                                                   (hau 600)
                                                   (nb 1)
                                                   (top-marge 30)
                                                   (marge 10)
                                                   (largeur-mur 5)
                                                   (moteur (new 'MoteurCollisions (/ freq 1.2)))
                                                   (affichage (new 'TamponDouble freq lar hau nb))
                                                 )
                     (ask self 'setSlot 'freq freq)
                     (ask self 'setSlot 'moteur moteur)
                     (ask self 'setSlot 'affichage affichage)
                     (new 'DessinPolygone (/ 2 lar) (/ 2 hau) (list marge top-marge (- lar marge) top-marge (- lar marge) (- hau marge) marge (- hau marge)) (ask self 'getSlot 'affichage) (ask self 'getSlot 'moteur)
                          (make-rgb 0.9 0.8 0.7))
                     ;(let ((poly1 (new 'DessinPolygone 400 300 '(375 275 375 225 425 225 425 275 475 275 475 325 425 325 425 375 375 375 375 325 325 325 325 275))))
                     ; (ask poly1 'enregistrerMoteur moteur)
                     ;  (ask poly1 'enregistrerAffichage (ask self 'getSlot 'affichage))
                     ;  #f)
                     ; (let ((poly2 (new 'DessinPolygone 200 300 '(175 275 175 225 225 225 225 275 275 275 275 325 225 325 225 375 175 375 175 325 125 325 125 275))))
                     ; (ask poly2 'enregistrerMoteur moteur)
                      ;(ask poly2 'enregistrerAffichage (ask self 'getSlot 'affichage))
                      ;#f)
                     (ask self 'ajouterJoueur)
                     (ask self 'commencer)
                     ))
         )
        
        )
