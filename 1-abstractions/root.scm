;;; Cube root procedures:
( define ( cube n )
	( * n n n )
)

( define ( cube-improve x y ) 
	( / 
		(+ (/ x ( sq y ) )( * 2 y ))
	  	3 )
)

;;; Square root procedures:
( define ( sq n )
	( * n n )	
)

( define ( valid x y n ) 
	( if (= n 2) 
		( = ( sq-improve x y ) y )	
		( = ( cube-improve x y) y )
	)
)

( define (sq-improve x y) 
	(newline) (display "x: ") (display x) (newline)
	(display "improved: ") (display ( / (+ y (/ x y)) 2	))
	( / (+ y (/ x y)) 2	)
)

;;; Standard procedures:
( define ( find-root x y n )
	( if (not (valid x y n))
		( if (= n 2) 
			( find-root x ( sq-improve x y ) n ) ; !valid.
			( find-root x ( cube-improve x y ) n ) 
		)
		y ; Guess is valid
	)
)

( define ( root n x ) ;; Find nth root of x if n is 2 or 3.
	( find-root x 50.0 n )
)

( root 2 2 )
( root 2 0.0000002 )
( root 2 10000000000000 )
( root 3 2500 )
( root 3 2 )
