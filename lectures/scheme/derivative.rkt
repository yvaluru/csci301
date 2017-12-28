#lang racket

(define d
  (lambda (f)
    (let* ((delta 0.00001)
           (two-delta (* 2 delta)))
      (lambda (x)
        (/ (- (f (+ x delta)) (f (- x delta)))
           two-delta)))))

(let ((x 5))
  (displayln ((d (lambda (x) (* x x x))) x))
  (displayln (* 3 x x))
  )

(let ((x 1.234))
  (displayln ((d sin) x))
  (displayln (cos x))
  )

