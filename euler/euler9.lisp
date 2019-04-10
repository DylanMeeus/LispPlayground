; pythagorean triplet
; a^2 + b^2 = c^2
; where a + b + c = 1000



(defun solve()
  (loop for a from 1 to 1000 do
        (loop for b from 1 to (- 1000 a) do
              (loop for c from 1 to (- 1000 (+ b a)) do
                    (if (= (expt c 2) (+ (expt b 2) (expt a 2)))
                        (progn
                          (if (= 1000 (+ a b c))
                            (print (* a b c))
                            'no-op))
                        'no-op
                        )))))

