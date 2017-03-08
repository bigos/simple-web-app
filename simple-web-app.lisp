;;;; simple-web-app.lisp

(in-package #:simple-web-app)

;;; make parenscript work nicely with cl-who
(setf parenscript:*js-string-delimiter* #\")

(defvar *routes*
      (compile-routes
       ;;html content uris
       (:GET    "/javascript.js"                        'javascript-handler)
       (:GET    "/"                                     'home-handler)
       (:GET    "/people"                               'home-handler)
       (:GET    "/people/:first/:last"                  'get-people-handler)
       (:GET    "/people/put/:first/:last/:description" 'put-people-handler)
       (:PUT    "/people/:first/:last/:description"     'put-people-handler)))

;;this should point to your static files root
(defvar *file-root* (cl-fad:merge-pathnames-as-directory
                     *default-pathname-defaults*
                     "web/"))

(defvar *macceptor* (make-instance 'simple-routes:simpleroutes-acceptor
                                   :routes '*routes*
                                   :port 5000
                                   :document-root *file-root*
                                   :access-log-destination *terminal-io*
                                   :message-log-destination *terminal-io*))
(setf *show-lisp-errors-p* t
      *show-lisp-backtraces-p* t)

;;code below restarts the acceptor every time this file is loaded
(if (hunchentoot::acceptor-shutdown-p *macceptor*)
    (hunchentoot:start *macceptor*)
    (progn
      (hunchentoot:stop *macceptor*)
      (hunchentoot:start *macceptor*)))
