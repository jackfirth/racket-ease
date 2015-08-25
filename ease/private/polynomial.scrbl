#lang scribble/manual

@(require "util/doc.rkt")


@defproc[(polynomial-ease [degree (>/c 0)]) proper-ease/c]{
  Returns an easing function that starts out proportionally slow,
  then speeds up. The slope of this acceleration is determined by
  @racket[degree]. When graphed, the resulting easing is a polynomial
  curve of the given degree.
  @ease-examples[
    (ease-real (polynomial-ease 1) 0 1000 5)
    (ease-real (polynomial-ease 2) 0 1000 5)
    (ease-real (polynomial-ease 3) 0 1000 5)
]}

@defproc[(symmetric-polynomial-ease [degree (>/c 0)]) proper-ease/c]{
  Like @racket[polynomial-ease], but the returned easing is symmetric.
  It starts out slow, speeds up towards the middle, then slows down
  as it approaches the end.
  @ease-examples[
    (map exact->inexact (ease-real (symmetric-polynomial-ease 1) 0 1000 4))
    (map exact->inexact (ease-real (symmetric-polynomial-ease 2) 0 1000 4))
    (map exact->inexact (ease-real (symmetric-polynomial-ease 5) 0 1000 4))
]}
