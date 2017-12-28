
(define make-stack
  (lambda ()
    (let ((ls '()))
      (lambda (msg . args)
        (cond
          ((eqv? msg 'empty?) (null? ls))
          ((eqv? msg 'push!)
           (set! ls (cons (car args) ls)))
          ((eqv? msg 'top) (car ls))
          ((eqv? msg 'pop!)
           (set! ls (cdr ls)))
          (else "oops"))))))

(define stack1 (make-stack))
(define stack2 (make-stack)) 

(stack1 'empty?)
(stack2 'empty?)

(stack1 'push! 'a)
(stack1 'empty?)
(stack2 'empty?)  

(stack1 'push! 'b)
(stack2 'push! 'c)
(stack1 'top) 
(stack2 'top)

(stack1 'pop!)
(stack2 'empty?) 
(stack1 'top) 

(stack2 'pop!)
(stack2 'empty?) 
