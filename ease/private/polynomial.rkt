#lang sweet-exp racket/base

require racket/contract/base

provide
  contract-out
    polynomial-ease (-> (>/c 0) proper-ease/c)
    symmetric-polynomial-ease (-> (>/c 0) proper-ease/c)

require "base.rkt"

module+ test
  require racket/list
          rackunit
          "invert.rkt"


(define ((polynomial-ease degree) x)
  (expt x degree))


module+ test
  (define (quadratic-ease x) (* x x))
  (check-equal? (ease-real (polynomial-ease 1) 0 100 5)
                (ease-real linear-ease 0 100 5))
  (check-equal? (ease-real (polynomial-ease 2) 0 100 5)
                (ease-real quadratic-ease 0 100 5))


(define ((symmetric-polynomial-ease degree) x)
  (define x^d (expt x degree))
  (/ x^d (+ x^d (expt (- 1 x) degree))))

module+ test
  (check-equal? (ease-real (symmetric-polynomial-ease 1) 0 100 5)
                (ease-real (ease-invert (symmetric-polynomial-ease 1)) 0 100 5))
  (check-true (< (second (ease-real (symmetric-polynomial-ease 2) 0 100 5))
                 (second (ease-real (symmetric-polynomial-ease 1) 0 100 5))))
  (check-true (> (fourth (ease-real (symmetric-polynomial-ease 2) 0 100 5))
                 (fourth (ease-real (symmetric-polynomial-ease 1) 0 100 5))))
                

