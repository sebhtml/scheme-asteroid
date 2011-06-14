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


(classe ObjetPeutAvoirBouclier
        ((privé bouclier))
        
        (


         (privé ajouterBouclier (self couleur vie)
               ; (print "AJout")(print (ask self 'classe))
                (let                          ((bouclier (new 'Bouclier self vie couleur)))
                ;  (print "fin22")
                  (ask self 'setSlot 'bouclier bouclier)
               ;   (print "fin2")
                  (ask bouclier 'enregistrerMoteur (ask self 'getSlot 'moteur))
                  (ask bouclier 'enregistrerAffichage (ask self 'getSlot 'affichage)))
              ;  (print "fin")
                )
         
          (publique rayonBouclier (self)
                   #f)
         
         (publique mourir (self)
                   (ask (ask self 'getSlot 'bouclier) 'enlever)
                   )
         ))