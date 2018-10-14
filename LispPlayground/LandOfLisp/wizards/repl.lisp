; lisp REPL for our game-engine

(defun game-repl()
  (loop (print (eval (read)))))
