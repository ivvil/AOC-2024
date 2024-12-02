;;;; aoc 2024.lisp

(in-package #:dev.shft.aoc-2024)

(defclass day () ())

(defconstant +input-path+ (asdf-utilities:system-relative-pathname "aoc-2024" "inputs/"))

(defvar *days* ())

(defvar *input* ())

(defgeneric get-input (day))

;; (defmethod get-input ((day day))
;;   )

