( define count 0 )
( define (cube x) (* x x x) )
( define ( p x )
	(set! count (+ count 1))
	( - ( * 3 x ) ( * 4 ( cube x ) ) )
)

( define ( sine a ) 
	( if ( not ( > (abs a) 0.1 ) )
		 a
		 (p (sine (/ a 3.0)))
	)
)

( sine 12.15 )
count
