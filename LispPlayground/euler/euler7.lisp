
; find prime #10001

(defun is-prime(x)
  (let* ((prime (or (= x 2) (not (evenp x)))))
    (unless (eq prime 'nil)
        (loop for i from 3 to (- x 1) do
              (if (= 0 (mod x i))
                (setf prime 'nil)
                'no-op
                ))
    )
    prime))


(defun find-10001-prime(possibility found)
  (if (= found 10001)
    possibility
    (progn
      (if (is-prime possibility)
        (find-10001-prime (+ 2 possibility) (1+ found))
        (find-10001-prime (+ 2 possibility) found)
        ))))
