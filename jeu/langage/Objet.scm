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


;
; une classe pour les objets
;
(classe Objet
        ()
        
        (
         (privé getSlot-cons (self slot)
                (bfs (cons self null) (lambda (premier) (assq slot (cdr premier)))
                     (lambda (premier) (cdr (ask premier 'getSlot-cons 'supers)))))
         
         
         ;
         ; méthode pour affecter un slot
         ;
         (privé setSlot (self slot valeur)
                (let ((res (ask self 'getSlot-cons slot)))
                  (if res
                      (set-cdr! res valeur)
                      (error (format "Attribut ~s  inconnu pour ~s" slot self)))))
         ;
         ; méthode pour obtenir une slot
         ;
         (privé getSlot (self slot)
                (let ((res (ask self 'getSlot-cons slot)))
                  (if res
                      (cdr res)
                      (error (format "Attribut ~s  inconnu pour ~s" slot self)))))
         ;
         ; constructeur d'objets.
         ;
         (publique Objet (self) 
                   #f)
         
         (publique additionnerAttribut (self k v)
                   (ask self 'setSlot k (+ (ask self 'getSlot k) v)))
         
         )
        
        )
