;Sébastien Boisvert <Sebastien.Boisvert@USherbrooke.ca>        
;Pier-Luc Desgagné <Pier-Luc.Desgagne@USherbrooke.ca>  
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
; classe pour double buffering
; deux tampons de calcul
; un tampon d'affichage

(classe TamponDouble
        ((privé can)
         (privé tampons)
         (privé nb)
         (privé imagesParSeconde)
         (privé table)
         (privé tamponStatique)
         (privé delaisRemplissage)
         (privé delaisCopiage)
         (privé fond)
         (privé i))
        (
         
         (publique TamponDouble (self imagesParSeconde lar hau nb)
                   (define (creer-tampons i)
                     (if (< i nb)
                         (begin (vector-set! (ask self 'getSlot 'tampons) i 
                                             (new 'Canevas "buffer" lar hau 'pixmap)) (creer-tampons (+ i 1))))
                     )
                   
                   (ask self 'setSlot 'can (new 'Canevas "Nom" lar hau 'viewport))
                   (ask self 'setSlot 'tampons (make-vector nb))
                   (creer-tampons 0)
                   (ask self 'setSlot 'tamponStatique (new 'Canevas "" lar hau 'pixmap))
                   (ask self 'setSlot 'fond (new 'Fond))
                   (ask (ask self 'getSlot 'fond) 'dessiner (ask self 'getSlot 'tamponStatique))
                   (ask self 'setSlot 'imagesParSeconde imagesParSeconde)
                   (ask self 'setSlot 'delaisCopiage (/ 1.0 imagesParSeconde))
                   (ask self 'setSlot 'delaisRemplissage (/ 0.1 imagesParSeconde))
                   (ask self 'setSlot 'table (new 'TableDispersion))
                   (ask self 'setSlot 'i 8)
                   (ask self 'setSlot 'nb nb))
         
         (publique enlever (self numero)
                   (ask (ask self 'getSlot 'table) 'enlever numero))
         
         (publique ajouter (self objet)
                   (let ((i (ask self 'obtenir_i)))
                     (ask (ask self 'getSlot 'table) 'mettre i objet)
                     i))
         
         (publique obtenir_i (self)
                   (ask self 'setSlot 'i (+ (ask self 'getSlot 'i) 1))
                   (ask self 'getSlot 'i))
         
         (publique tracer (self canevas)
                   (define (iter valeur)
                     (ask valeur 'dessiner canevas))
                   (ask canevas 'enCours!)
                   (ask canevas 'nettoyer)
                   ; ce code qui met du noir ne devrai pas être ici ...
                   ; le tampon double utilise une table de dispersion pour stocker ces éléments
                   ; donc il n'y a pas d'ordre...
                   (ask canevas 'dessiner (ask self 'getSlot 'tamponStatique))
                   (for-each iter (ask (ask self 'getSlot 'table) 'valeurs))
                   (ask canevas 'plein!)
                   )
         
         (publique aller-THREAD (self)
                   (lambda () (ask self 'aller)))
         
         (publique tracer-THREAD (self canevas)
                   (lambda () (ask self 'tracer canevas)))
         
         
         (publique aller (self)
                   (thread-resume (thread (ask self 'remplir-tampons-THREAD)))
                   (ask self 'afficher)
                   )
         
         (publique afficher (self)
                   (define (afficher-tampon can tampons i)
                     (if (>= i 0)
                         (let ((tampon (vector-ref (ask self 'getSlot 'tampons) i))) 
                           (if (ask tampon 'estPlein)
                               (begin
                                 (ask can 'dessiner tampon))
                               (afficher-tampon can tampons (- i 1))))))
                   (define (iter can tampons)
                     (afficher-tampon can tampons (- (ask self 'getSlot 'nb) 1))
                     (sleep (ask self 'getSlot 'delaisCopiage))
                     (iter can tampons))
                   (iter  (ask self 'getSlot 'can)  (ask self 'getSlot 'tampons)))
         
         (privé remplir-tampons-THREAD (self)
                (lambda () (ask self 'remplir-tampons)))
         
         (publique remplir-tampons (self)
                   (define (iter tampons)
                     (define (iter-step i)
                       (if (< i (ask self 'getSlot 'nb))
                           (let ((tampon (vector-ref (ask self 'getSlot 'tampons) i))) 
                             (if (ask tampon 'estVide)
                                 (begin
                                   (ask self 'tracer tampon))
                                 (iter-step (+ i 1))))))
                     (iter-step 0)
                     (sleep (ask self 'getSlot 'delaisRemplissage))
                     (iter tampons))
                   (iter   (ask self 'getSlot 'tampons)))
         
         ))
