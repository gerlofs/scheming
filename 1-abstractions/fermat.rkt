#lang sicp

; Fermat's test for primality.

( define ( sqr x ) ( * x x ))
( define ( even x ) (= (remainder x 2) 0) )

( define ( expn-mod b e m )
		(cond ((= e 0) 1)
			  ((even e) (remainder (sqr ( expn-mod (/ e 2) m )) m))
			  (else (remainder (* b (expn-mod b (- e 1) m)) m)))
)

( define ( fermat-test n )
		( define ( test x ) (= (expn-mod x n n) x))
		( test (+ 1 ( random (- n 1))) )
)

(fermat-test 13)
