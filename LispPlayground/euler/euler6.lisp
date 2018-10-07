; sum-square difference
; diff between sum of squares, and square of sums for the first 100 numbers



(defun sum-squared (m)
  (expt (/ (* m (+ m 1)) 2) 2)
  )


(defun squared-sum (curr limit sum)
  (let ((new-sum (+ sum (expt curr 2))))
  (if (= curr limit)
    sum
    (squared-sum (+ curr 1) limit new-sum)))
)

(defun solve() 
  ; square of sum is of 100 is easy
    (- (sum-squared 100) (squared-sum 1 100 0))
  )
