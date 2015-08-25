#lang racket/base

(require
  scribble/eval
  "scribble-include-no-subsection.rkt"
  (for-label ease
             lens
             racket/base
             racket/contract))

(provide
 ease-examples
 (all-from-out "scribble-include-no-subsection.rkt")
 (for-label
  (all-from-out ease
                lens
                racket/base
                racket/contract)))


(define-syntax-rule (define-examples-form id require-spec ...)
  (begin
    (define (eval-factory)
      (define base-eval (make-base-eval))
      (base-eval '(require require-spec)) ...
      base-eval)
    (define-syntax-rule (id datum (... ...))
      (examples #:eval (eval-factory) datum (... ...)))))


(define-examples-form ease-examples ease)
