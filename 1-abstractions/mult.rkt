#lang sicp

( define ( even x ) ( = ( remainder x 2) 0 ))
( define ( double x ) ( + x x ))
( define ( halve x ) 
		 ( if ( even x ) 
			  (/ x 2)
			  x)
)

; Double n times or add n to product and reduce n by 1.
( define ( mult b n )
		( define ( naive b n ) 
				( if ( = b 0 )
					 0 
					 ( + b ( mult b ( - n 1)))
				)
		)

		; Employ same concept as expr-iter from previous exercise.
        ; sum starts at zero instead of 1.

        ( define ( iter b n s )
				(cond ((= n 0) s)
						((even n) (iter (double b) (/ n 2) s))
						(else (iter b (- n 1) (+ b s))))
		)

		 ( if ( = n 0) 
			 0 
		 ( iter b n 0 ))
)

( mult 2 16021)
