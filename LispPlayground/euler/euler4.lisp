; largest palindrome of 2 3-digit numbers

(defvar *largest* 0)

(defun digit-count(int) 
  (if (= int 0)
    1
    (+ (floor (log int 10)) 1)
    )
)

;1337 -> 7331
(defun reverse-integer(int exponent orig)
  (cond 
    ((= int 0)
     0
     )
    ((> (digit-count int) 0)
      (let (
            (first-digit (floor (/ int (expt 10 (- (digit-count int) 1)))))
            (remainder (mod int (expt 10 (- (digit-count int) 1)))))
        ; end of variable declaration
        (if (= remainder 0)
        (* first-digit (expt 10 exponent))
        (+ (* first-digit (expt 10 exponent)) (reverse-integer remainder (- (digit-count orig) (digit-count remainder)) orig)
           ))
      ))
   (t 
     int)
   )
)

(defun is-palindrome(x)
  (eq x (reverse-integer x 0 x))
  )

(defun process(x)
  (and (is-palindrome x) (> x *largest*) (setf *largest* x))
  )

(defun solve() 
  (loop for i from 100 to 999 
        do (loop for j from 100 to 999 
                 do (process (* i j))
                      )))
  
