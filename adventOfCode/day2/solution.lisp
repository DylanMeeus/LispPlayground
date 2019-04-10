(load "../read-data.lisp")
(ql:quickload "split-sequence")

(defparameter *filename* "data.txt")


; count the sum of the max->min delta
(defun checksum-delta(sum head tail)
    (if (or (eq '() head) (equal '(nil) head))
    sum
    (checksum-delta (+ sum (- (reduce #'max head) (reduce #'min head))) (car tail) (cdr tail))
  ))

(defun solve()
  (let* ((data (get-file *filename*))
         (string-data (mapcar (lambda (x) (split-sequence:SPLIT-SEQUENCE #\Tab x)) data))
         (number-data (mapcar (lambda (x) (mapcar (lambda (z) (ignore-errors (parse-integer z))) x)) string-data))
         )
    (checksum-delta 0 (car number-data) (cdr number-data))))

