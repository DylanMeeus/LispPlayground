(load "../read-data.lisp")
(ql:quickload "split-sequence")

(defparameter *filename* "data.txt")


(defun find-delta(numbers)
  'nil
  )

(defun solve()
  (let* ((data (get-file *filename*))
         (string-data (mapcar (lambda (x) (split-sequence:SPLIT-SEQUENCE #\Tab x)) data))
         (number-data (mapcar (lambda (x) (mapcar (lambda (z) (ignore-errors (parse-integer z))) x)) string-data))
         )
    number-data))

