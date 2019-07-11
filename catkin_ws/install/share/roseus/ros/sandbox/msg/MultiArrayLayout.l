;; Auto-generated. Do not edit!


(when (boundp 'sandbox::MultiArrayLayout)
  (if (not (find-package "SANDBOX"))
    (make-package "SANDBOX"))
  (shadow 'MultiArrayLayout (find-package "SANDBOX")))
(unless (find-package "SANDBOX::MULTIARRAYLAYOUT")
  (make-package "SANDBOX::MULTIARRAYLAYOUT"))

(in-package "ROS")
;;//! \htmlinclude MultiArrayLayout.msg.html


(defclass sandbox::MultiArrayLayout
  :super ros::object
  :slots (_stoplights _deface ))

(defmethod sandbox::MultiArrayLayout
  (:init
   (&key
    ((:stoplights __stoplights) (let (r) (dotimes (i 0) (push (instance sandbox::MultiArraySubDimension :init) r)) r))
    ((:deface __deface) 0)
    )
   (send-super :init)
   (setq _stoplights __stoplights)
   (setq _deface (round __deface))
   self)
  (:stoplights
   (&rest __stoplights)
   (if (keywordp (car __stoplights))
       (send* _stoplights __stoplights)
     (progn
       (if __stoplights (setq _stoplights (car __stoplights)))
       _stoplights)))
  (:deface
   (&optional __deface)
   (if __deface (setq _deface __deface)) _deface)
  (:serialization-length
   ()
   (+
    ;; sandbox/MultiArraySubDimension[] _stoplights
    (apply #'+ (send-all _stoplights :serialization-length)) 4
    ;; int16 _deface
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sandbox/MultiArraySubDimension[] _stoplights
     (write-long (length _stoplights) s)
     (dolist (elem _stoplights)
       (send elem :serialize s)
       )
     ;; int16 _deface
       (write-word _deface s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sandbox/MultiArraySubDimension[] _stoplights
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _stoplights (let (r) (dotimes (i n) (push (instance sandbox::MultiArraySubDimension :init) r)) r))
     (dolist (elem- _stoplights)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; int16 _deface
     (setq _deface (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get sandbox::MultiArrayLayout :md5sum-) "c71496406d4b1a871cb3ce7d7daa62da")
(setf (get sandbox::MultiArrayLayout :datatype-) "sandbox/MultiArrayLayout")
(setf (get sandbox::MultiArrayLayout :definition-)
      "sandbox/MultiArraySubDimension[] stoplights # colection of stoplights to send message
int16 deface

================================================================================
MSG: sandbox/MultiArraySubDimension
string label # cross, street, blink warning
int16[] colors # [red,gree,blue,custom]

")



(provide :sandbox/MultiArrayLayout "c71496406d4b1a871cb3ce7d7daa62da")


