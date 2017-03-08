(in-package #:simple-web-app)

(defun application-js ()
  (parenscript:ps
    (defun greeting-callback ()
      (alert "Hello World"))

    ))
