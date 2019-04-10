(defvar *sum* 0)

(defun fib(a b)
  (let ((next_fib (+ a b)))
  (unless (> b 4000000)
    (when (= (mod next_fib 2) 0)
      (setf *sum* (+ *sum* next_fib)))
    (fib b next_fib)
    )
  ))

(defun solve()
  ;; reset sum variable when loading script
  (setf *sum* 0)
  (fib 0 1)
  (write *sum*)
)

(solve)
