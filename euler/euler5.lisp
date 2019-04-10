;; smallest number that is divisble with numbers 1 -> 20 without remainder

; test for divisibility
(defun divisible-til-20(i divisor)
      (if (= divisor 20)
        'T
        ;else
        (if (= (mod i divisor) 0)
          (divisible-til-20 i (+ divisor 1))
          'nil
          )
      )
  )

(defun solve(x)
    (if(not(divisible-til-20 x 1))
      (solve (+ x 2))
      x
      )
)

(solve 2520)
