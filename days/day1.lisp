;;;; day1.lisp

(in-package #:dev.shft.aoc-2024)

(defday 1)

(defmethod run ((day day1))
  (multiple-value-bind (left right) (get-input day)
    (unless (and (listp left) (listp right) (= (length left) (length right)))
      (error "Input lists must be of equal length and valid lists."))
    (apply #'+ (mapcar (lambda (x y) (abs (- x y))) left right))))

(defmethod get-input ((day day1))
  (let ((file (split-sequence:split-sequence #\Newline (call-next-method)))) ; Calls the generic method
    (let ((left '())
          (right '()))
      (dolist (str file)
        (when (and (stringp str) (> (length str) 0))
          (let ((split (split-sequence:split-sequence #\Space str)))
            (when (>= (length split) 4)
              (push (parse-integer (first split) :junk-allowed t) left)
              (push (parse-integer (fourth split) :junk-allowed t) right)))))
      (values (sort left #'<) (sort right #'<)))))


