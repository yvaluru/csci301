#lang racket

(define make-pair
  (lambda (a b)
    (lambda (command)
      (if (eq? command 'first) a b))))

(define x (make-pair 4 8))
(define y (make-pair 100 200))
(define z (make-pair x y))  


(x 'first)
(y 'second)
(z 'first)
((z 'second) 'first)