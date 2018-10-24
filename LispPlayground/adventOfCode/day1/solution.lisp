
; read file

(defun get-file()
  (with-open-file (stream "data.txt")
    (loop for line = (read-line stream nil)
          while line
          collect line)))

(defun get-test()
  '("1122"))


(defun sum-if-matching(sum head tail)
  (if (= 0 (length tail))
    sum
    (progn
      (if (string= head (subseq tail 0 1))
        (sum-if-matching (+ sum (parse-integer head)) (subseq tail 0 1) (subseq tail 1 (length tail)))
        (sum-if-matching sum (subseq tail 0 1) (subseq tail 1 (length tail)))))))

(defun solve()
  (let* ((content (car (get-file)))
    ;make the list circular
    (circular-list (concatenate 'string content (subseq content 0 1))))
    (sum-if-matching 0 (subseq circular-list 0 1) (subseq circular-list 1 (length circular-list)))))


