;;
; d arrays where d is the depth of the triangle.
; computer values in x array using sums of values in x-1 array starting at index 0 to the length-1 of the array.
;   values are stored in x array at index 1 to length-1 of array x-1.
;   e.g.
;   [
;       [1],
;       [1, 1], l = 2
;       [1, 2, 1], i = 1 to l: a[n][i] = a[n-1][i-1] + a[n-1][i]
;       [1, 3, 3, 1],
;       [1, 4, 6, 4, 1],
;   ]
;	... It's more of a pascal's right-angled triangle, but it works!

( define (triangle d)
	( define v (make-vector (+ d 1)) ) ; Vector of d+1 items where d is the depth.
	
	( define ( construct d ) 
		; Create the md. vector and fill it, once created, return it.
		( vector-set! v d (make-vector (+ d 1) 1) )
		( if ( = d 0 ) 
			 v
			 (construct (- d 1))
		)
	)

	( define ( calc r ) 
		; Calculate t he interior nodes by summing elements from v[d-1] starting from 0 to l-1 
		;	where l is the length of the array v[d-1]. The sums are stored in v[d] starting from 1
		; 	and ending at l-1.	
		
		;	(display "Calculating array for row: ")(display r)(newline)	
		( define l (vector-length (vector-ref v (- r 1))) )
		( define ( calc-i i ) 
			( define previous (vector-ref v (- r 1)) )
			( define current (vector-ref v r) )
			; Check for i  = ( l - 2 ), if so, end.
			( vector-set! current i 
						  (+ (vector-ref previous i) (vector-ref previous (- i 1))))
			( vector-set! v r current )
			( if ( = i (- l 1))
				 1
				 (calc-i (+ i 1))
			)	
		)

		( calc-i 1 )
		( if ( >= r d ) 
			 1 
			 ( calc (+ r 1) )
		)
	)

	( define ( print i )
		( define target (vector-ref v i))
		( define l (vector-length target))
		( define ( subprint n )
			( display (vector-ref target n) )
			( display " " )
			( if ( >= n (- l 1))
				 (newline)
				 ( subprint (+ n 1) )
			)
		)

		( subprint 0 )
		( if ( >= i d ) 
			 1
			 ( print (+ i 1) )
		)
	)

	( construct d )
	;(vector-ref ( vector-ref v 1) 1)
	( calc 2 )
	( print 0 )	
)

( triangle 20 )
