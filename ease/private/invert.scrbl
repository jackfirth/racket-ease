#lang scribble/manual

@(require "util/doc.rkt")


@defproc[(ease-invert [easing ease/c]) ease/c]{
  Returns an easing that is like @racket[easing], but
  with proportional changes inverted from @racket[easing].
  @ease-examples[
    (define (quadratic-ease x) (* x x))
    (ease-real quadratic-ease 0 100 5)
    (ease-real (ease-invert quadratic-ease) 0 100 5)
]}

@defproc[(ease-reverse [easing ease/c]) ease/c]{
  Returns an easing that is like @racket[easing], but
  with it's steps reversed.
  @ease-examples[
    (ease-real linear-ease 0 100 5)
    (ease-real (ease-reverse linear-ease) 0 100 5)
]}
