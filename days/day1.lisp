;;;; day1.lisp

(in-package #:dev.shft.aoc-2024)

(defclass day1 (day) ())

(defmethod run ((day day1))
  (multiple-value-bind (left right) (get-input day)
    (unless (and (listp left) (listp right) (= (length left) (length right)))
      (error "Input lists must be of equal length and valid lists."))
    (apply #'+ (mapcar (lambda (x y) (abs (- x y))) left right))))

(defmethod get-input ((day day1))
  (let* ((path (merge-pathnames "1/input" +input-path+))
         (file (uiop:read-file-lines path))
         (left '())
         (right '()))
    (dolist (str file)
      (when (and (stringp str) (> (length str) 0)) ; Validate line
        (let ((split (split-sequence:split-sequence #\Space str)))
          (when (>= (length split) 4) ; Ensure at least 4 elements
            (push (parse-integer (first split) :junk-allowed t) left)
            (push (parse-integer (fourth split) :junk-allowed t) right)))))
    (values (sort left #'<) (sort right #'<))))

