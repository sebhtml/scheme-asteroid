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

(define (charger-fichier fichier)
  (load (string-append "" fichier)))

(require (lib "graphics.ss" "graphics"))
(require (lib "compat.ss"))
(require (lib "math.ss"))

(charger-fichier "jeu/langage/macro.scm")
(charger-fichier "jeu/langage/langage-objet.scm")
(charger-fichier "jeu/langage/Classe.scm")
(charger-fichier "jeu/langage/TableDispersion.scm")
(charger-fichier "jeu/langage/Objet.scm")

(charger-fichier "jeu/physique/MoteurCollisions.scm")
(charger-fichier "jeu/physique/CollisionVectorielle.scm")
(charger-fichier "jeu/physique/Calculable.scm")

(charger-fichier "jeu/geometrie/GeometrieCercle.scm")
(charger-fichier "jeu/geometrie/GeometrieDeBase.scm")
(charger-fichier "jeu/geometrie/GeometrieRectangle.scm")
(charger-fichier "jeu/geometrie/GeometriePolygone.scm")

(charger-fichier "jeu/affichage/Canevas.scm")
(charger-fichier "jeu/affichage/TamponDouble.scm")
(charger-fichier "jeu/affichage/Affichable.scm")

(charger-fichier "jeu/effets/Reacteur.scm")
(charger-fichier "jeu/effets/Explosion.scm")
(charger-fichier "jeu/effets/Explose.scm")

(charger-fichier "jeu/intelligence/Mere.scm")

(charger-fichier "jeu/dessin/Dessin.scm")
(charger-fichier "jeu/dessin/DessinRectangle.scm")
(charger-fichier "jeu/dessin/DessinPolygone.scm")

(charger-fichier "jeu/armurerie/Arme.scm")
(charger-fichier "jeu/armurerie/Laser.scm")
(charger-fichier "jeu/armurerie/BouleMagique.scm")
(charger-fichier "jeu/armurerie/MissileGuide.scm")
(charger-fichier "jeu/armurerie/Detectable.scm")

(charger-fichier "jeu/equipement/Bouclier.scm")
(charger-fichier "jeu/equipement/ObjetPeutAvoirBouclier.scm")
(charger-fichier "jeu/bonus/Bonus.scm")
(charger-fichier "jeu/bonus/BonusBouclier.scm")
(charger-fichier "jeu/bonus/BonusVie.scm")
(charger-fichier "jeu/bonus/BonusLaser.scm")
(charger-fichier "jeu/bonus/BonusMissile.scm")
(charger-fichier "jeu/bonus/BonusPiege.scm")
(charger-fichier "jeu/bonus/BonusRien.scm")
(charger-fichier "jeu/bonus/BonusMonstre.scm")

(charger-fichier "jeu/mechants/Mechant.scm")
(charger-fichier "jeu/mechants/Roche.scm")
(charger-fichier "jeu/mechants/Gobelin.scm")

(charger-fichier "jeu/avion/AvionJoueur.scm")
(charger-fichier "jeu/avion/ObjetPeutAvoirReacteur.scm")

(charger-fichier "jeu/Jeu.scm")
(charger-fichier "jeu/Vivant.scm")
(charger-fichier "jeu/Fond.scm")
(charger-fichier "jeu/Invincible.scm")
(charger-fichier "jeu/ADesPoints.scm")
(charger-fichier "jeu/FaitDommages.scm")
(charger-fichier "jeu/PartieTermine.scm")


; @author Sébastien
(define j (new 'Jeu))



