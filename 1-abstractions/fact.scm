( define (factorial n)
	( define product 1)
	( define count 1 )
	( define ( fact-inner p c )
		;	n! = n * [(n -1) * (n-1) * ... 1]
		;	p *= c, for c = 1 -> n
		; 	p (product), c (count). 
		(newline)(display " Count: " )(display c)(display " Product: ")(display p)	
		( if ( < n c ) 
			p
			( fact-inner (* p c)(+ c 1) )
		)
	)

	(fact-inner product count) 
)

( factorial 6 )(newline)
( factorial 12 )(newline)
( factorial 32 )(newline)
