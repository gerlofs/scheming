#lang sicp
; Sqr abstraction
( define (sqr n)
   (* n n)
)
; Cube abstraction
( define (cube n)
   (* (sqr n) n)
)

( define (incr n) (+ n 1))

; Summation of a series abstraction.
( define (sum term a next b)
   ;(display a)(display " ")(display b)(newline)
   (if (> a b)
       0
       (+ (term a)
          (sum term (next a) next b))
   )
)

; Calculate a definite integral of function f between the limits a and
;     b y approximation:
( define (integral f a b dx)
  ( define (dx-next x)
     (+ x dx)
  ) 
  ( * (sum f (+ a (/ dx 2.0)) dx-next b)
      dx)
)

; 1.29:
;    Simpson's Rule is a more accurate method of numerical integration
;        than the method illustrated. Using Simpson's Rule, the integ-
;        -ral of function *f* between *a* and *b* is approximated as:
;            h/3(y[0] + 4[y1] + 2[y2] + 4[y3] + 2[y4] + ... +
;                2[y[n-2]] + 4[y[n-1]] + y[n])
;
;        where h =(b - a)/n, for some even integer n, and y[k] =
;        f(a+kh).
;        Increasing *n* increases the accuracy of the approximation.
;
;    Define a procedure that takes as arguments *f*, *a*, *b*, and *n*
;        and returns the value of the integral, computed using Simpso-
;        -n's Rule. Use your procedure to integrate *cube* between 0
;        and 1 with *n* = 100 and *n* = 1000, and compare the results
;        to those of the *integral* procedure shown.

; y[k] = f(a + (k*h)),
; next = (4 / (k % 2)) * y[k]
; next = if ( k = n ) { y[k] } else { 4 / (1+(k%2)) * y[k] }
(define (simpson f a b n)
  ; Abstract h.
  (define h (/(- b a)n))
  ; Abstract base term.
  (define (yk k) (f (+ (* k h) a)))
  (define (s-term k)
    ; Determine coefficient to use.
    (define (coeff k)
      (if (= (remainder k 2) 0)
          2
          4
      )
     )
    ; If we're not at the end of the series, use coefficient.
    (if (= k n)
        (yk k)
        (* (coeff k) (yk k))
    )
  )
  ; Multiply the sum of the series of terms by h/3.
 (* (/ h 3) (sum s-term 0 incr n))
)

(integral cube 0 1 0.01) ; Underestimation
(integral cube 0 1 0.001) ; Underestimation
(integral cube 0 1 0.00001353) ; Overestimation
(simpson cube 1 4 4)
(simpson cube 0.0 1.0 100)
(simpson cube 0.0 1.0 1000)
