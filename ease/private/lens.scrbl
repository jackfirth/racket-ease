#lang scribble/manual

@(require "util/doc.rkt")


@defproc[(ease-real/lens [a-lens (lens/c any/c real?)]
                         [easing ease/c]
                         [target any/c]
                         [stop real?]
                         [num-steps exact-positive-integer?])
         list?]{
  Similar to @racket[ease-real], but instead of returning a
  list of intermediate values, accepts a @racketmodname[lens]
  that specifies a view and a target, and returns a list of
  intermediate targets each with their view eased.
  @ease-examples[
    (require lens)
    (ease-real/lens first-lens
                    linear-ease
                    '(0 a b)
                    10
                    4)
]}
