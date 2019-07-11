
(cl:in-package :asdf)

(defsystem "sandbox-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Stoplight" :depends-on ("_package_Stoplight"))
    (:file "_package_Stoplight" :depends-on ("_package"))
    (:file "StoplightMultiArray" :depends-on ("_package_StoplightMultiArray"))
    (:file "_package_StoplightMultiArray" :depends-on ("_package"))
    (:file "TimeMultiArray" :depends-on ("_package_TimeMultiArray"))
    (:file "_package_TimeMultiArray" :depends-on ("_package"))
    (:file "mipper" :depends-on ("_package_mipper"))
    (:file "_package_mipper" :depends-on ("_package"))
  ))