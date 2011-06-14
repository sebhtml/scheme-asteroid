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
(classe TableDispersion 
        ((privé table))
        (
         
         (publique TableDispersion (self)
                 (ask self 'setSlot 'table (make-hash-table)))
         
         (publique mettre (self key val)
                 (hash-table-put! (ask self 'table) key val))
         
         (publique valeurs (self)
                 (hash-table-map (ask self 'table) (lambda (key val) val)))
         
         (publique enlever (self key)
                 (hash-table-remove! (ask self 'table) key))
         
         (publique obtenir (self key)
                 (hash-table-get (ask self 'table) key null))
         
         (publique table (self)
                 (ask self 'getSlot 'table))
         
         (publique pourChaque (self fonction)
                 (hash-table-for-each (ask self 'table) fonction))
         
         ))

