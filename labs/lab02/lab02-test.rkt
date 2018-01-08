#lang racket

(require rackunit "lab02.rkt")

(define same?
  (lambda (a b)
    (< (abs (- a b)) 0.01)))

(check same?
       ((d (lambda (x) (* x x x))) 5)
       (* 3 5 5))

(check same? 
       ((i (lambda (x) (* 3 x x))) 2 4)
       (- (* 4 4 4) (* 2 2 2)))

(check same?
       ((i (d (lambda (x) (* x x)))) 2 4)
       (- (* 4 4) (* 2 2)))