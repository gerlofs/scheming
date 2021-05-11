; Count the number of ways to change amount 'a';	using 'n' denominations of coins.
;
; This breaks down into two base cases where:
;	'a' = 0: There is 1 way to change this.
;	'n' = 0: There is zero ways to change zero coins.
; And two further cases for each coin denomination 'd':
;	'd' > 'a': Coin cannot be used to change 'a'.
;	'd' < 'a': Coin can be used in the changing of 'a':
;
; SICP's discussion of *how* to do this is (I find) very 
; 	opaque. The problem is not actually as confusing as 
;	it sounds once you realise that when finding a solu-
;	tion, a coin may be included or excluded to the cou-
;	nt. If it's included, the subproblem is reduced to
;	finding the number of ways to change 'a-d'. It's a
;	very recursive-heavy problem. It's easier to visu-
;	alise the algorithm (in my opinion). See: coin.png
;	in the same directory as this file for a partial 
;	example tree using ( coin-count 10 3 ). 
;	

( define coins (vector 1 2 5 10 25 50) )
( define start-n ( vector-length coins ) )

( define ( solve a ) 
	( define memo (make-vector (+ a 1 ) 0) )
	( vector-set! memo 0 1)
	( define ( sub-sum d c ) 
; 		(display "Populating memo: ")(display c)(display " >> ")
		( vector-set! memo c (+ (vector-ref memo c) (vector-ref memo (- c d))))
;		(display (vector-ref memo c))(newline)
		( if ( >= c a )
			#t
			( sub-sum d (+ c 1) )
		)
	)

	( define ( solve-coin c ) 
  		( if ( < c start-n )
			(if ( sub-sum (vector-ref coins c)(vector-ref coins c) )
			( solve-coin (+ c 1))
			 -1)

			( vector-ref memo a)
		) 
	)

	; c = count, d = denomination, a = amount, n = number of coins.
	; v = value.	
	( solve-coin 0 )
)

( define (coin-count a n )
	(cond ((= a 0) 1)
   		  ((or (< a 0) (= n 0)) 0)
		  (else
		  	( + ( coin-count a (- n 1) )
 				( coin-count (- a ( vector-ref coins ( - n 1 )))
							 n ))))
)

;( coin-count 275 start-n )
( solve 275 )
