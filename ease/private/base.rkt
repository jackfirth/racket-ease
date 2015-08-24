#lang sweet-exp racket/base

require racket/contract/base

provide
  contract-out
    ease/c contract?
    proper-ease/c contract?
    ease-real (-> ease/c real? real? real? (listof real?))
    linear-ease proper-ease/c

require racket/function
        racket/list

module+ test
  require rackunit


(define ease/c
  (-> (between/c 0 1) real?))

(define proper-ease/c
  (-> (between/c 0 1) (between/c 0 1)))


(define (range-n start stop num-steps)
  (define step (/ (- stop start) num-steps))
  (range start stop step))


(define (ease-real easing start stop num-steps)
  (define magnitude (- stop start))
  (define (apply-easing intermediate-value)
    (define normal (/ (- intermediate-value start) magnitude))
    (define eased-normal (easing normal))
    (+ (* eased-normal magnitude) start))
  (map apply-easing (range-n start stop num-steps)))

(define linear-ease identity)


module+ test
  (check-equal? (ease-real linear-ease 0 5 5)
                '(0 1 2 3 4))
