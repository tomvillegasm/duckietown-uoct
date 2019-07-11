;; Auto-generated. Do not edit!


(when (boundp 'sandbox::Stoplight)
  (if (not (find-package "SANDBOX"))
    (make-package "SANDBOX"))
  (shadow 'Stoplight (find-package "SANDBOX")))
(unless (find-package "SANDBOX::STOPLIGHT")
  (make-package "SANDBOX::STOPLIGHT"))

(in-package "ROS")
;;//! \htmlinclude Stoplight.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sandbox::Stoplight
  :super ros::object
  :slots (_Stoplight _type _direction _colors ))

(defmethod sandbox::Stoplight
  (:init
   (&key
    ((:Stoplight __Stoplight) (instance std_msgs::Header :init))
    ((:type __type) "")
    ((:direction __direction) "")
    ((:colors __colors) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _Stoplight __Stoplight)
   (setq _type (string __type))
   (setq _direction (string __direction))
   (setq _colors __colors)
   self)
  (:Stoplight
   (&rest __Stoplight)
   (if (keywordp (car __Stoplight))
       (send* _Stoplight __Stoplight)
     (progn
       (if __Stoplight (setq _Stoplight (car __Stoplight)))
       _Stoplight)))
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:colors
   (&optional __colors)
   (if __colors (setq _colors __colors)) _colors)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _Stoplight
    (send _Stoplight :serialization-length)
    ;; string _type
    4 (length _type)
    ;; string _direction
    4 (length _direction)
    ;; int16[] _colors
    (* 2    (length _colors)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _Stoplight
       (send _Stoplight :serialize s)
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;; string _direction
       (write-long (length _direction) s) (princ _direction s)
     ;; int16[] _colors
     (write-long (length _colors) s)
     (dotimes (i (length _colors))
       (write-word (elt _colors i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _Stoplight
     (send _Stoplight :deserialize buf ptr-) (incf ptr- (send _Stoplight :serialization-length))
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _direction
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _direction (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int16[] _colors
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _colors (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _colors i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(setf (get sandbox::Stoplight :md5sum-) "6654bda664e47f8222314d4f89a55a15")
(setf (get sandbox::Stoplight :datatype-) "sandbox/Stoplight")
(setf (get sandbox::Stoplight :definition-)
      "Header Stoplight
string type # cross, street, blink warning
string direction # norht2south, east2west, up2down
int16[] colors # [red,gree,blue,custom]

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



(provide :sandbox/Stoplight "6654bda664e47f8222314d4f89a55a15")


