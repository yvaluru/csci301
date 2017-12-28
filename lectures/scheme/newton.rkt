#lang racket

;; Newton's method:
;; To solve the equation f(x) = 0, when you know the
;; derivative of the function f, start with a guess for x,
;; and then iterate the sequence:
;; x <- x - f(x)/f'(x)
;; until it is close enough.

(define close-enough?
  (lambda (x1 x2 epsilon)
    (< (abs (- x1 x2)) epsilon)))

(define new-guess 
  (lambda (x f fprime)
    (- x (/ (f x) (fprime x)))))

(define loop 
  (lambda (f fprime x1 epsilon)
    (let ((x2 (new-guess x1 f fprime)))
      (if (close-enough? x1 x2 epsilon)
          x2
          (loop f fprime x2 epsilon)))))

(define newton 
  (lambda (f fprime epsilon)
    (loop f fprime 1.0 epsilon)))

;; Let's try some examples.

;; To find the solution to sin(x) = x^3
;; f(x) = sin(x) - x^3 = 0
;; f'(x) = cos(x) - 3x

(define solve01
  (lambda ()
    (newton (lambda (x) (- (sin x) (* x x x)))
            (lambda (x) (- (cos x) (* 3 x)))
            0.000001)))

(displayln
 (format "The solution to sin(x) = x^3 is ~a"
         (solve01)))

(displayln 
 (format "This should be close to zero: ~a"
         (let ((s (solve01)))
           (- (sin s) (* s s s)))  ))

;; We can also use this to write general purpose functions.
;; To find the square root of n we have
;; f(x) = x^2 - n = 0
;; f'(x) = 2x
(define square-root 
  (lambda (n)
    (newton (lambda (x) (- (* x x) n))
            (lambda (x) (* 2 x))
            0.0001)))

(displayln
 (format "The square root of two is approximately: ~a"
         (square-root 2.0)))
(displayln
 (format "The square root of 100 is approximately: ~a"
         (square-root 100.0)))