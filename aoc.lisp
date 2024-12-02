;;;; aoc 2024.lisp

(in-package #:dev.shft.aoc-2024)

(defclass day () ())

(defconstant +input-path+ (asdf-utilities:system-relative-pathname "aoc-2024" "inputs/"))

(defvar *days* ())

(defvar *input* ())

(defgeneric get-input (day))

(defmethod get-input ((day day))
  (let* ((class-name (symbol-name (class-name (class-of day)))) ; Get class name as string
         (day-number (subseq class-name 3)) ; Extract the number after "day"
         (path (merge-pathnames (format nil "~A/input" day-number) +input-path+)))
    (unless (probe-file path)
      (error "Input file ~A not found." path))
	(format t "Class name: ~a. Day number: ~a. Path: ~a" class-name day-number path)
    (uiop:read-file-string path)))

(defmacro defday (day-number)
  `(progn
     (defclass ,(intern (format nil "DAY~A" day-number)) (day) ())
     (pushnew ',(intern (format nil "DAY~A" day-number)) *days*)))



