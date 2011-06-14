(define table (make-hash-table))

(hash-table-put! table 1 2)

(hash-table-put! table 2 2)

(hash-table-remove! table 2)

(hash-table-get table 1)

(define (pop i table )
  (if (< i 1000) (begin (hash-table-put! table i i)
                        (pop (+ i 1) table))))

(pop 0 table)

(hash-table-count table)

(define (contains table value)
  (define a #f)
  (define (checker key value2)
    (if (= value value2)
        (set! a #t)))
  (hash-table-for-each table checker)
  a)

(contains table 5)