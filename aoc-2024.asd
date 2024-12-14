;;;; aoc 2024.asd

(asdf:defsystem #:aoc-2024
  :description "Describe aoc 2024 here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (:split-sequence
			   :cl-ppcre)
  :components ((:file "package")
               (:file "aoc")))
