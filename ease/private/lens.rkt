#lang sweet-exp racket/base

require racket/contract/base

provide
  contract-out
    ease-real/lens (-> lens?
                       ease/c
                       any/c
                       real?
                       exact-positive-integer?
                       list?)

require fancy-app
        lens
        "base.rkt"


(define (lens-set-each lens target . views)
  (map (lens-set lens target _) views))

(define (lens-fragment lens target fragmenter)
  (map (lens-set lens target _)
       (fragmenter (lens-view lens target))))

(define (ease-real/lens lens easing target stop num-steps)
  (lens-fragment lens target
                 (ease-real easing _ stop num-steps)))

