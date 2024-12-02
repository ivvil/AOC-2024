;;;; day2.lisp

(in-package #:dev.shft.aoc-2024)

(defday 2)

(defmethod get-input ((day day2))
  (split-sequence:split-sequence #\Newline (call-next-method)))

(defmethod run ((day day2))
  (let* ((input (get-input day))
		(safe (mapcar #'day2-parse-line input)))
	(count t safe)))

(defun largest-distance (numbers)
  "Returns the largest distance between two numbers in the list"
  (reduce (lambda (max-dist pair)
			(max max-dist (abs (- (second pair) (first pair)))))
		  (mapcar #'list numbers (cdr numbers))
		  :initial-value 0))

(defun trend (a b)
  "Gets the trend between two numbers"
  (if (= a b)
	  ':eq
	  (if (< 0 (- a b))
		  ':dec
		  ':inc)))

(defun compute-trends (numbers)
  "Compute the trend (:inc or :dec) between each consecutive pair of numbers in the list."
  (when (and numbers (cdr numbers)) ; Ensure the list has at least two elements
    (mapcar #'(lambda (pair)
                (trend (first pair) (second pair)))
            (mapcar #'list numbers (cdr numbers)))))

(defun day2-parse-line (line)
  (let ((parts (mapcar #'parse-integer (split-sequence:split-sequence #\Space line))))
	(and (> 4 (largest-distance parts)) (= 1 (list-length (remove-duplicates (compute-trends parts)))))))