(defvar *sum* 0)

(defun fib(a b)
  (unless (> b 4000000)
    (when (= (mod (+ a b) 2) 0)
      (setf *sum* (+ *sum* (+ a b))
            ))
    (fib b (+ a b))
    )
  )

(defun solve()
  ;; reset sum variable when loading script
  (setf *sum* 0)
  (fib 0 1)
  (write *sum*)
)

(solve)
