#lang sweet-exp racket/base

require racket/contract/base

provide
  contract-out
    ease-invert (case-> (-> proper-ease/c proper-ease/c)
                        (-> ease/c ease/c))
    ease-reverse (case-> (-> proper-ease/c proper-ease/c)
                         (-> ease/c ease/c))

require "base.rkt"

module+ test
  require fancy-app
          rackunit


module+ test
  (define (quadratic-ease-in x) (* x x))


(define ((ease-invert easing) x)
  (- 1 (easing (- 1 x))))

module+ test
  (check-equal? (ease-real (ease-invert quadratic-ease-in) 0 100 5)
                (reverse (map (- 100 _) (ease-real quadratic-ease-in 0 100 5))))


(define ((ease-reverse easing) x)
  (easing (- 1 x)))

module+ test
  (check-equal? (ease-real (ease-reverse quadratic-ease-in) 0 100 5)
                (reverse (ease-real quadratic-ease-in 0 100 5)))
