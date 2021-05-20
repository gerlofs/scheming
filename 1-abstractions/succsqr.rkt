#lang sicp

; Successive squaring is the act of computing an exponent n by using
; 	the outcomes of exponents multiplied together
; 	e.g.
;		b^2 = b * b
;		b^4 = b^2 * b^2
; 		rather than:
;		b^4 = b * b * b * b

( define ( sqr x ) ( * x x ))

( define ( naive n e ) 
		( if ( = e 0 )
				1
				( * n ( naive n (- e 1) ) )
		)
)

( define ( expn n e )
		( define ( exp-iter n e p )
				( cond ((= e 0) p)
					   ((= (remainder e 2) 0) (exp-iter (square n) (/ e 2) p))
					   (else (exp-iter n (- e 1) (* n p)))
				)
		)

		(exp-iter n e 1)
)

(expn 6 6)
