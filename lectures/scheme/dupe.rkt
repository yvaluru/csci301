#lang racket

(define dupe0
  (lambda (ls)
    (cond ((null? ls) ls)
          (else (cons (car ls)
                      (dupe0 (cdr ls)))))))

(dupe0 '(1 2 3))

(define dupe1
  (lambda (ls)
    (define loop
      (lambda (ls1 ls2)
        (cond ((null? ls1) ls2)
              (else (loop (cdr ls1) (cons (car ls1) ls2))))))
    (loop ls '())))

(dupe1 '(1 2 3))

(define dupe2
  (lambda (ls)
    (let loop ((ls1 ls) (ls2 '()))
      (cond ((null? ls1) ls2)
            (else (loop (cdr ls1) (cons (car ls1) ls2)))))))

(dupe2 '(1 2 3))

(define dupe3
  (lambda (ls)
    (define loop
      (lambda (ls1 ls2)
        (cond ((null? ls1) ls2)
              (else (loop (cdr ls1) (cons (car ls1) ls2))))))
    (loop (loop ls '()) '())))

(dupe3 '(1 2 3))

