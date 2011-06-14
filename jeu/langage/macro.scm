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
; pour avoir une plus belle syntaxe
;
; @author Sébastien Boisvert

(define-syntax analyser-params
  (syntax-rules ()
    ((analyser-params paramètres)
     ())
    ))

(define-syntax analyser-methode
  (syntax-rules ()    
    ((analyser-methode (acces nom par instruction1 ...))
     (list 'acces 'nom (lambda par instruction1 ...)))
    ))

(define-syntax analyser-attribut
  (syntax-rules ()
    
    ((analyser-attribut (acces nom))
     (list 'acces 'nom))
    ))

(define-syntax analyser-superclasses
  (syntax-rules ()
    ((analyser-superclasses m1)
     (cons 'm1
           null))
    ((analyser-superclasses m1 m2 ...)
     (cons 'm1
           (analyser-superclasses m2 ...)))))

(define-syntax analyser-methodes 
  (syntax-rules ()
    ((analyser-methodes m1)
     (cons (analyser-methode m1)
           null))
    ((analyser-methodes m1 m2 ...)
     (cons (analyser-methode m1)
           (analyser-methodes m2 ...)))))


(define-syntax analyser-attributs
  (syntax-rules (null)
    ((analyser-attributs )
     ())
    ((analyser-attributs ())
     ())
    ((analyser-attributs null)
     null)
    ((analyser-attributs a1)
     (cons (analyser-attribut a1)
           null))
    ((analyser-attributs a1 a2 ...)
     (cons (analyser-attribut a1)
           (analyser-attributs a2 ...)))))


(define-syntax classe
  (syntax-rules (classe hérite null Objet)
    ((classe nomClasse hérite (c1 ...)
             (a1 ...) (m1 ...))
     (creer-classe 'nomClasse (analyser-superclasses c1 ...)
                   (analyser-attributs a1 ...)
                   (analyser-methodes m1 ...)
                   )
     )
       ((classe Objet
             (a1 ...) (m1 ...))
     (creer-classe 'Objet null
                   (analyser-attributs a1 ...)
                   (analyser-methodes m1 ...)
                   )
     ) 
    ((classe nomClasse
             (a1 ...) (m1 ...))
     (creer-classe 'nomClasse (analyser-superclasses Objet)
                   (analyser-attributs a1 ...)
                   (analyser-methodes m1 ...)
                   )
     )
    ((classe nomClasse hérite C
             attributs methodes)
     (classe nomClasse hérite (C)
             attributs methodes)
     )
    
    ))



(define-syntax new
  (syntax-rules ()
    ((new class-name arg0 ...)
     (let ((newSelf (allouer-mémoire class-name)))
       (ask newSelf class-name arg0 ...)
       newSelf))))
