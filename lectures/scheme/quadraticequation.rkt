#lang racket
(define (solve-quadratic-equation a b c)
  (let ((disc (sqrt (- (* b b)
                        (* 4.0 a c)))))
    (list     
     (/ (+ b disc)
        (* 2.0 a))
     (/ (+ (- b) disc)
        (* 2.0 a)))))


(solve-quadratic-equation 1 -3 2)