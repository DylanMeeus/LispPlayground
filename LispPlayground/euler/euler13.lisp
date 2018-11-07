

(defun get-file()
  (with-open-file (stream "data.txt")
    (loop for line = (read-line stream nil)
          while line
          collect line)))

; run solve and just read the first ten numbers
(defun solve()
  (let ((num (mapcar (lambda (x) (parse-integer x)) (get-file))))
    (subseq (write-to-string(reduce #'+ num)) 0 10)
    ))
