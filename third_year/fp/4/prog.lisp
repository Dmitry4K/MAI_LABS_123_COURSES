(defun isNumber (s)
	(and (char>= s #\0) (char<= s #\9))
)

(defun copy-text(text)
	(let (
		(cp-text (make-list (length text) :initial-element (make-string 0)))
		)
		(do ((i 0 (+ i 1)))
			((>= i (length text)))
			(setf (nth i cp-text) (copy-seq (nth i text)))
		)
		cp-text
	)
)
(defun task (arg-text)
	(let (
		(indexOfFirstPlus -1)
		(indexOfFirstString -1)
		(text (copy-text arg-text))
			)	
	(do ((i 0 (+ i 1)))
		((>= i (length text)))
		(let ((str (nth i text)))
			(do ((j 0 (+ j 1)))
				((>= j (length str)))
				(if (char= (char str j) #\+)
					(let ()
						(setq indexOfFirstPlus j)
						(setq indexOfFirstString i)
						(setq j (length str))
						(setq i (length text))
					)
				)
			)
		)
	)
	(if (not (= indexOfFirstPlus -1))
		(let ()
		(do ((i 0 (+ i 1)))
			((>= i indexOfFirstString))
			(let ((str (nth i text)))
				(do ((j 0 (+ j 1 )))
					((>= j (length str)))
					(if (isNumber (char str j))
						(setf (char str j) #\-)
					)
				)
			)
		)
		(do ((i 0 (+ i 1)))
			((>= i indexOfFirstPlus))
			(if (isNumber (char (nth indexOfFirstString text) i))
				(setf (char (nth indexOfFirstString text) i) #\-)
			)
		)
		)
	)
	text
	)
)