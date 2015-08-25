#lang scribble/manual

@(require "util/doc.rkt")


@defproc[(ease-real [easing ease/c]
                    [start real?]
                    [stop real?]
                    [num-steps real?])
         (listof real?)]{
  Returns a list of intermediate values between @racket[start] and @racket[stop].
  The number of values is equal to @racket[num-steps] plus one, and the difference
  between successive values is determined by @racket[easing].
  @ease-examples[
    (ease-real linear-ease 0 100 4)
]}

@deftogether[(@defthing[ease/c contract?]
              @defthing[proper-ease/c contract?])]{
  Contracts for easings. An easing is a function mapping real numbers
  between one and zero to any real number. @racket[ease/c] is equivalent to
  the following contract:
  @racketblock[
    (-> (between/c 0 1) real?)
  ]

  Easing functions map @emph{proportions of the ease finished} to
  @emph{proportions of the distance travelled between start and stop}.
  An easing function that returns exactly what was given to it is
  equivalent to easing linearly, the value of the halfway step returned
  by @racket[ease-real] will be halfway between the start and stop values
  given to @racket[ease-real]. If the easing function returns numbers
  smaller than that given to it, then @racket[ease-real]'s steps will
  be proportionally smaller.
  @ease-examples[
    (define (quadratic-ease x) (* x x))
    (ease-real quadratic-ease 0 100 4)
  ]

  An easing function that returns a number less than zero will cause
  @racket[ease-real] to return values less than its starting point
  during the easing, an easing function that returns a number greater
  than one will cause @racket[ease-real] to return values greater than
  its stopping point. This is useful for "elastic" effects, for example
  an easing that moves an object just past a stopping position then
  bounces it back, but most easing functions will satisfy this contract:
  @racketblock[
    (-> (between/c 0 1) (between/c 0 1))
  ]

  An ease satisfying this more restrictive contract is a @racket[proper-ease/c].
}

@defthing[linear-ease proper-ease/c]{
  The simplest easing. Makes no changes at all to the relationship between
  step proportion and distance proportion. Equivalent to @racket[identity]
  with a more restrictive contract.
  @ease-examples[
    (ease-real linear-ease 0 100 4)
]}
