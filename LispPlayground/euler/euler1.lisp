(defvar *sum* 0)


(defun solve(i) 
    (unless (= i 1000)
      (and (or (= (mod i 3) 0) (= (mod i 5) 0)) (setf *sum* (+ *sum* i)))
      (solve (+ i 1))
  )
)

(solve 0)
