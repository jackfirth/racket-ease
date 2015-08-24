#lang racket/base

(module+ test
  (require doc-coverage
           ease)

  (check-all-documented 'ease))
