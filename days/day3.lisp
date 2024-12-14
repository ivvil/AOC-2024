;;;; day3.lisp

(in-package #:dev.shft.aoc-2024)

(defday 3)

(defun find-mul-tokens (input)
  (let ((ptrn "mul\\(\\d{1,3},\\d{1,3}\\)"))
	(ppcre:all-matches-as-strings ptrn input)))

(defun find-mul-do-dont-tokens (input)
  (let ((ptrn "(mul\\(\\d{1,3},\\d{1,3}\\))|(do\\\(\\))|(don't\\(\\))"))
	(ppcre:all-matches-as-strings ptrn input)))

(defun parse-mul (mul)
  (let ((comma (position #\, mul))
		(par (position #\) mul)))
	(* (parse-integer (subseq mul 4 comma))
	   (parse-integer (subseq mul (1+ comma) par)))))

(defmethod run ((day day3))
  (let ((input (get-input day)))
	(apply '+ (mapcar 'parse-mul (find-mul-tokens input)))))

(defmethod run-second ((day day3))
  (let ((input (get-input day))
		(enabled t))
	(loop for exp in (find-mul-do-dont-tokens input)
		  sum (let* ((oparen (position #\( exp))
					 (op (subseq exp 0 oparen)))
				(cond
				  ((equal op "do") (progn
									(setf enabled t)
									0))
				  ((equal op "don't")  (progn
										(setf enabled nil)
										0))
				  ((equal op "mul") (if enabled
										(parse-mul exp)
										0))
				  (t 0))))))
