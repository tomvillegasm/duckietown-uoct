;; Auto-generated. Do not edit!


(when (boundp 'sandbox::mipper)
  (if (not (find-package "SANDBOX"))
    (make-package "SANDBOX"))
  (shadow 'mipper (find-package "SANDBOX")))
(unless (find-package "SANDBOX::MIPPER")
  (make-package "SANDBOX::MIPPER"))

(in-package "ROS")
;;//! \htmlinclude mipper.msg.html


(defclass sandbox::mipper
  :super ros::object
  :slots (_label _data ))

(defmethod sandbox::mipper
  (:init
   (&key
    ((:label __label) "")
    ((:data __data) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _label (string __label))
   (setq _data __data)
   self)
  (:label
   (&optional __label)
   (if __label (setq _label __label)) _label)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; string _label
    4 (length _label)
    ;; int16[] _data
    (* 2    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _label
       (write-long (length _label) s) (princ _label s)
     ;; int16[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (write-word (elt _data i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _label
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _label (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int16[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(setf (get sandbox::mipper :md5sum-) "03274f755f3fa14034497c515fc2e37a")
(setf (get sandbox::mipper :datatype-) "sandbox/mipper")
(setf (get sandbox::mipper :definition-)
      "string label
int16[] data

")



(provide :sandbox/mipper "03274f755f3fa14034497c515fc2e37a")


