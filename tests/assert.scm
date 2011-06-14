(define (assertion-Egaux expected result message_en_cas_echec)
  (if (not (equal? expected result))
      (begin (print message_en_cas_echec)(newline))))

(define (assertion-nonEgaux expected result message_en_cas_echec)
  (if (equal? expected result)
      (begin (print message_en_cas_echec)(newline))))