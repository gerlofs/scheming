#lang sicp

( define ( square x ) ( * x x ) )
( define ( is-divisor n d ) (= (remainder n d) 0) )

( define ( find-divisor n d ) 
		; If divisior 'd' can divide n evenly (integer result) then so can n/d, but neither can be bigger than sqrt(n).
		; Maximum value to check is sqrt(n), thus order of growth is O(sqrt(n)).
		(cond ((> (square d) n) n)
			  ((is-divisor n d) d)
			  (else (find-divisor n (+ d 1))))
)

( define ( smallest-divisor n ) ( find-divisor n 2 ) )
( define ( is-prime n ) ( = (smallest-divisor n) n) )

( smallest-divisor 100 )
( smallest-divisor 36 )
( smallest-divisor 519 )
( smallest-divisor  7919 )
( smallest-divisor 13 )
( smallest-divisor 217 )
( is-prime 100 )
( is-prime 36 )
( is-prime 519 )
( is-prime  7919 )
( is-prime 13 )
( is-prime 217 )