#lang info


(define collection 'multi)


(define version "0.1")


(define deps
  '("base"
    "sweet-exp"
    "fancy-app"))


(define build-deps
  '("cover"
    "racket-doc"
    "scribble-lib"
    "doc-coverage"))


(define test-omit-paths
  '("info.rkt"
    "ease/info.rkt"
    "ease/main.scrbl"
    "private/base.scrbl"
    "private/invert.scrbl"))
