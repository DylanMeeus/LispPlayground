; test parameters

(defparameter *test1* '("1122"))
(defparameter *test2* '("1212"))

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

; sum all numbers that have a similar neighbour
(defun solve()
  (let* ((content (car (get-file)))
    ;make the list circular
    (circular-list (concatenate 'string content (subseq content 0 1))))
    (sum-if-matching 0 (subseq circular-list 0 1) (subseq circular-list 1 (length circular-list)))))


; sum all numbers that have a similar number halfway across the list
(defun solve2()
  (let* ((sum 0)
         (content (car (get-file)))
         (skip-position (/ (length content) 2)) ; how far do we have to look forward? 
         (circular-list (concatenate 'string content content)))
    (loop for i from 0 to (1-(length content)) do
          (cond ((string= (subseq content i (1+ i)) (subseq circular-list (+ i skip-position) (1+(+ i skip-position))))
                 (setf sum (+ sum (parse-integer (subseq content i (1+ i))))))))
    sum
    ))
