(require (lib "graphics.ss" "graphics"))


(open-graphics)

(define vp (open-pixmap "Test" 500 500))

(define vp2 (open-viewport "Test2" 500 500))
((draw-viewport vp) "red") 

(define p1 (make-posn 250 100) )
(define p2 (make-posn 250 400) )
((draw-line vp) p1 p2 "yellow")

(copy-viewport vp vp2)

(define p3 (make-posn 20 20) )

(define p4 (make-posn 10 50))
(define p5 (make-posn 20 50))
(define p6 (make-posn 20 60))
(define p7 (make-posn 15 70))
(define p8 (make-posn 10 60))

(define (draw-stuff n x y z)
  (define (iter n x y)
    ((draw-polygon vp2) (list p4 p5 p6 p7 p8) (make-posn x y) "black")
    (if (= n 0)
        null
        (iter (- n 1) (+ x 10) (+ y 10))))
  (define (iter2 n x y z)
    (iter n x y)
    (if (= z 0)
        null
        (iter2 n x (+ y 20) (- z 1))))
  (iter2 n x y z))

(draw-stuff 10 50 100 10)

((draw-string vp2) (make-posn 400 260) "testt" "blue") 
((clear-string vp2) (make-posn 400 275) "tesstt") 

(define loopp (lambda (n)
                (sleep 0.005) ;Sans sleep, le garbage collector creer un lag tout les 5secondes
                (if (ready-mouse-click vp2)
                    (loopp #t))
                (if n
                    ((draw-solid-ellipse vp2) (query-mouse-posn vp2) 8 8 "blue"))
                (if (ready-mouse-release vp2)
                    (loopp #f))
                (loopp n)))
(loopp #f)