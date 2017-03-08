;;;; simple-web-app.asd

(asdf:defsystem #:simple-web-app
  :description "Describe simple-web-app here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :depends-on (#:hunchentoot)
  :serial t
  :components ((:module "lib"
                        :components ((:file "simple-routes")))
               (:file "package")
               (:file "simple-web-app")))
