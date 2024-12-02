;;;; day2.lisp

(in-package #:dev.shft.aoc-2024)

(defday 2)

(defmethod get-input ((day day2))
  (split-sequence:split-sequence #\Newline (call-next-method)))

(defmethod run ((day day2))
  (let ((input (get-input day)))
	(mapcar (lambda (x)
			  (reduce (lambda (result next)
						(let ((prev (car result)))
						  (if (>= (abs (- next prev)) 3)
							  (cons next (cdr result)) ; Continue with the next number
							  ))) ; Exit early if out of range
					  x
					  :initial-value (cons (first x) t)
					  :from-end nil)) input)))
