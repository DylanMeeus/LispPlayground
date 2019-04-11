(defvar *db* nil)

(defun make-cd (title artist rating ripped)
  (list :title title :artist artist :rating rating :ripped ripped))

(defun add-record (cd)
  (push cd *db*))

(defun dump-db() 
  (dolist (cd *db*)
    (format t "~{~a:~10t~a~}~%" cd)))


(defun prompt-read (msg)
  (format *query-io* "~a : " msg)
  (force-output *query-io*)
  (read-line *query-io*))


(defun prompt-for-cd()
  (make-cd
    (prompt-read "Title")
    (prompt-read "Artist")
    (or (parse-integer (prompt-read "Rating") :junk-allowed t) 0)
    (y-or-n-p "Ripped")))


(defun add-cds()
  (loop (add-record (prompt-for-cd))
        (if (not (y-or-n-p "Another?")) (return))))
