#lang scribble/manual

@(require "util/doc.rkt")


@defproc[(ease-invert [easing ease/c]) ease/c]{
  Returns an easing that is like @racket[easing], but
  with proportional changes inverted from @racket[easing].
  If @racket[easing] starts out proportionally further
  along than @racket[linear-ease], then the returned
  easing will start out proportionally behind @racket[linear-ease].
  @ease-examples[
    (define (quadratic-ease x) (* x x))
    (ease-real quadratic-ease 0 100 4)
    (ease-real (ease-invert quadratic-ease) 0 100 4)
]}

@defproc[(ease-reverse [easing ease/c]) ease/c]{
  Returns an easing that is like @racket[easing], but
  with its steps reversed.
  @ease-examples[
    (ease-real linear-ease 0 100 4)
    (ease-real (ease-reverse linear-ease) 0 100 4)
]}
