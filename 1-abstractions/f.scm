; Compute f by means of a recursive process and an interative process.
; where f(n) = { n if n < 3, f(n-1)+2f(n-2)+3f(n-3) if n >= 3 }

( define (f n)
    ( define (f-rec n )
        ; Recursive solution.
        ( if ( < n 3 ) 
             n
              ( + ( f-rec (- n 1))
                  (* 2 ( f-rec (- n 2)))
                  (* 3 ( f-rec (- n 3))))
        )
   )
  
  ( define ( f-iter i a b c ) 
       ; Iterative solution.
       ; This was taken from schemewiki as it was better than my code.
       ; Avoid spawning recursively by evaluating the formula f(n) = f(n-1) + 2(f(n-2)) + 3(f(n-3)) and 
       ; passing it as the next 'a' variable. Swapping b for a and c for b also works to avoid needing to
       ; increment or decrement those values during evaluation.
       ( cond (( < n 3 ) n )
              (( <= i 0 ) a )
              (else ( f-iter (- i 1) (+ a ( * 2 b) (* 3 c)) a b ))
       )
  )

  ( f-rec n )
  (f-iter n 2 1 0)
)

(f 1)
(f 2)
(f 3)
(f 4)
(f 5)
(f 6)
( f 7 )
(f 8)
(f 9)
( f 10)
