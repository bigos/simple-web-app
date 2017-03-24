(in-package #:simple-web-app)

(defun default-layout (content)
  (who:with-html-output-to-string (out)
    (:html
     (:head
      (:title "layout")
      (:link :href "/stylesheets/style.css" :media "all" :rel "stylesheet" :type "text/css")
      (:script :src "/javascripts/jquery-3.1.1.min.js")
      (:script :src "/parenscript.js" ))
     (:body
      (:h1 :onclick (parenscript:ps (hiding-callback)) "In Layout")
      (:div
       (:a :href "/" "see the index"))
      (:hr))

     (who:fmt "~A" content)
     (:footer
      "footer"))))
