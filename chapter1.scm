#lang sicp

; common procedures
(define (even? n) (= (remainder n 2) 0))
(define (square n) (* n n))
(define (cube n) (* n n n))
(define (id n) n)
(define (inc n) (+ n 1))
(define (average a b) (/ (+ a b) 2))
(define (abs a) (if (< a 0) (- a) a))
(define (close-enough? a  b) (< (abs (- a b)) 0.0001))
(define (negative? a) (< a 0))
(define (positive? a) (> a 0))
(define (min a b) (if (< a b) a b))

; exercise 1.2
(/ (+ 5
      4
      (- 2
         (- 3
            (+ 6 (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))

; exercise 1.3
(define (min-of-three a b c) (min (min a b) (min a c)))
(define (sum-of-squares-of-two-largest-nums a b c)
  (- (+ (square a)
        (square b)
        (square c))
     (square (min-of-three a b c))))

; exercise 1.7
(define (sqrt n)
  (define (improve guess)
    (average guess (/ n guess)))
  (define (good-enough? guess)
    (or (close-enough? n (square guess))
        (close-enough? guess (improve guess))))
  (define (iter guess)
    (if (good-enough? guess) guess (iter (improve guess))))
  (iter 1.0))

; exercise 1.8
(define (cube-root n)
  (define (improve guess)
    (/ (+
        (/ n (square guess))
        (* 2 guess))
       3))
  (define (good-enough? guess)
    (or (close-enough? n (cube guess))
        (close-enough? guess (improve guess))))
  (define (iter guess)
    (if (good-enough? guess) guess (iter (improve guess))))
  (iter 1.0))

; exercise 1.9
; first procedure
; (+ 4 5)
; (inc (+ (dec 4) 5))
; (inc (+ 3 5))
; (inc (inc (+ (dec 3) 5)))
; (inc (inc (+ 2 5)))
; (inc (inc (inc (+ (dec 2) 5))))
; (inc (inc (inc (+ 1 5))))
; (inc (inc (inc (inc (+ (dec 1) 5)))))
; (inc (inc (inc (inc (+ 0 5)))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9
; second procedure
; (+ 4 5)
; (+ (dec 4) (inc 5))
; (+ 3 6)
; (+ (dec 3) (inc 6))
; (+ 2 7)
; (+ (dec 2) (inc 7))
; (+ 1 8)
; (+ (dec 1) (inc 8))
; (+ 0 9)
; 9