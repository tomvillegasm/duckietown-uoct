;; Auto-generated. Do not edit!


(when (boundp 'sandbox::TimeMultiArray)
  (if (not (find-package "SANDBOX"))
    (make-package "SANDBOX"))
  (shadow 'TimeMultiArray (find-package "SANDBOX")))
(unless (find-package "SANDBOX::TIMEMULTIARRAY")
  (make-package "SANDBOX::TIMEMULTIARRAY"))

(in-package "ROS")
;;//! \htmlinclude TimeMultiArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sandbox::TimeMultiArray
  :super ros::object
  :slots (_StoplightTime _minutes _seconds ))

(defmethod sandbox::TimeMultiArray
  (:init
   (&key
    ((:StoplightTime __StoplightTime) (instance std_msgs::Header :init))
    ((:minutes __minutes) (make-array 0 :initial-element 0 :element-type :integer))
    ((:seconds __seconds) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _StoplightTime __StoplightTime)
   (setq _minutes __minutes)
   (setq _seconds __seconds)
   self)
  (:StoplightTime
   (&rest __StoplightTime)
   (if (keywordp (car __StoplightTime))
       (send* _StoplightTime __StoplightTime)
     (progn
       (if __StoplightTime (setq _StoplightTime (car __StoplightTime)))
       _StoplightTime)))
  (:minutes
   (&optional __minutes)
   (if __minutes (setq _minutes __minutes)) _minutes)
  (:seconds
   (&optional __seconds)
   (if __seconds (setq _seconds __seconds)) _seconds)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _StoplightTime
    (send _StoplightTime :serialization-length)
    ;; int16[] _minutes
    (* 2    (length _minutes)) 4
    ;; int16[] _seconds
    (* 2    (length _seconds)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _StoplightTime
       (send _StoplightTime :serialize s)
     ;; int16[] _minutes
     (write-long (length _minutes) s)
     (dotimes (i (length _minutes))
       (write-word (elt _minutes i) s)
       )
     ;; int16[] _seconds
     (write-long (length _seconds) s)
     (dotimes (i (length _seconds))
       (write-word (elt _seconds i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _StoplightTime
     (send _StoplightTime :deserialize buf ptr-) (incf ptr- (send _StoplightTime :serialization-length))
   ;; int16[] _minutes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _minutes (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _minutes i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; int16[] _seconds
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _seconds (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _seconds i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(setf (get sandbox::TimeMultiArray :md5sum-) "8f037166f662f8756df277bb1c73f274")
(setf (get sandbox::TimeMultiArray :datatype-) "sandbox/TimeMultiArray")
(setf (get sandbox::TimeMultiArray :definition-)
      "Header StoplightTime
int16[] minutes
int16[] seconds

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :sandbox/TimeMultiArray "8f037166f662f8756df277bb1c73f274")


