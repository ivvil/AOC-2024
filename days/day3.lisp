;;;; day3.lisp

(in-package #:dev.shft.aoc-2024)

(defday 3)

(defun find-mul-tokens (input)
  (let ((ptrn "mul\\(\\d{1,3},\\d{1,3}\\)"))
	(ppcre:all-matches-as-strings ptrn input)))

(defun parse-mul (mul)
  (let ((comma (position #\, mul))
		 (par (position #\) mul)))
	 (* (parse-integer (subseq mul 4 comma))
		(parse-integer (subseq mul (1+ comma) par)))))

(defmethod run ((day day3))
  (let ((input (get-input day)))
	(apply '+ (mapcar 'parse-mul (find-mul-tokens input)))))
