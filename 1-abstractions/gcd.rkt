#lang sicp

( define ( GCD a b )
		; GCD(a, b) = GCD(b, r).
		; Find the remainder, call GCD with (b, r) as arguments until r is zero, then return b.
		;(display a)(display " ")(display b)(newline)
		( if ( = b 0 )
			 a
			 ( GCD b (remainder a b) ))
)

(GCD 36 6)
(GCD 3030 220)
(GCD 206 40)
(GCD 2 0)
(GCD 551 115)
(GCD 421 29)
(GCD 2207 7791)