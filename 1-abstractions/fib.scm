 https://www.youtube.com/watch?v=OQ5jsbhAv_M

; For low f(n), memoisation makes little difference, but 
; as n grows, the need for memoisation becomes clear.
; Use >`time scheme < fib.scm` with (fib 50) uncommented
; then rerun using (raw-fib 50) instead. 
; (fib n) can also be implemented iteratively.

(define MAX_FIB_N 100) ; vectors are fixed-length.
(define memo (make-vector MAX_FIB_N)) ; memoise using vector 

( define ( raw-fib n ) 
 	; The 'raw' naive recursive algorithm.
	( cond 
		((= n 0) 0)
		((<= n 2) 1)
		((> n 2) (+ (raw-fib (- n 1)) (raw-fib (- n 2))))
	)
)

(define (fib n) 
	;;	fibonacci sequence defined as
	;;	fib(n) = fib(n-1) + fib(n-2) if n > 2
	;; 	if n < 2 && > 0 fib(n) = 1, else fib(n) = 0.	

	( define (set-fib n)
		( vector-set! memo n 
			( cond 	
				((= n 0) 0)
				((<= n 2) 1)
				((> n 2) (+ (fib (- n 1)) (fib (- n 2))))
			)
		)
		( vector-ref memo n )
	)

	( define f ( vector-ref memo n ) )
	( display "F: ") (display f ) (display " N: ") (display n) (newline)
	( if f 
		f
		(set-fib n)
	)
	
)

;(raw-fib 50)
(fib 50)
