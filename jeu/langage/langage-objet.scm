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



(define (classe-objet objet)
  (if (not (pair? objet)) #f
      (car objet)))

(define (trouver-dans-classe-sans-supers classe message)
  (define (iter tableau)
    (if (null? tableau) 
        #f
        (let* ((premier (car tableau))
               (symbole (cadr premier))
               (definition (caddr premier))
               (autres (cdr tableau)))
          (if (eq? symbole message)
              definition
              (iter autres)))))
  (iter (methods-def classe)))

(define (bfs file fonction-trouver fonction-générer-enfants)
  (if (null? file)
      #f
      (let* ((premier (car file))
             (autres (cdr file))
             (resultat (fonction-trouver premier)))
        (if resultat
            resultat
            (bfs (append autres (fonction-générer-enfants premier)) fonction-trouver fonction-générer-enfants)))))

(define (get-method-dans-classe classe message)
  (bfs (cons classe null) (lambda (a) (trouver-dans-classe-sans-supers a message)) class-parent))

(define (get-method objet message)
  (cond ((eq? message 'get-method) get-method)
        ((eq? message 'classe) classe-objet)
        ((eq? message 'supers) (lambda (self) (ask self 'getSlot 'supers)))
        ((eq? message 'super-classes) (lambda (self) (class-parent (classe-objet self))))
        (else
         (let* ((classe (classe-objet objet))
                (methode (if (not classe) (error message) (get-method-dans-classe classe message))))
           (if (null? methode)
               (error (format "Méthode ~s n'existe pas pour l'objet ~s" message objet))
               methode)))))

(define (ask objet message . args)  
  (define method? procedure?)
  (let ((methode (get-method objet message)))
    (if (method? methode)
        (if (not (= (+ 1 (length args)) (procedure-arity methode)))
            (error (format "msg ~s on ~s with ~s (expected ~s)" message (classe-objet objet) (+ 1 (length args)) (procedure-arity methode)))
            (apply methode (cons objet args)))
        (error (format "Pas_de_methode ~s pour ~
                           la classe ~s"
                       message (classe-objet objet))))))

(define (slots-name class-name)
  (getprop class-name 'slots-name))

(define (class-parent class-name)
  (getprop class-name 'class-parent))

(define (methods-def class-name)
  (getprop class-name 'methods-def))

(define (creer-classe class-name class-parent slots-name methods-def)
  (putprop class-name 'class-parent class-parent)
  (putprop class-name 'methods-def methods-def)
  (putprop class-name 'slots-name slots-name))

(define (allouer-mémoire class-name)
  (define (iter noms)
    (if (null? noms)
        null
        (cons (cons (car noms) null) (iter (cdr noms)))))
  (if (pair? class-name)
      (cons (allouer-mémoire (car class-name))
            (allouer-mémoire (cdr class-name)))
      (if (null? class-name)
          null
          (let* ((attributs (slots-name class-name))
                 (noms (if (not attributs) (error class-name)(map cadr attributs)))
                 (superclasses (class-parent class-name))
                 (espaceParent (allouer-mémoire superclasses)))
            (cons class-name (cons (cons 'supers espaceParent)
                                   (iter noms)))))))

