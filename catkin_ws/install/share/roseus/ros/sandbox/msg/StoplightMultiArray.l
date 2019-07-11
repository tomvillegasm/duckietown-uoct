;; Auto-generated. Do not edit!


(when (boundp 'sandbox::StoplightMultiArray)
  (if (not (find-package "SANDBOX"))
    (make-package "SANDBOX"))
  (shadow 'StoplightMultiArray (find-package "SANDBOX")))
(unless (find-package "SANDBOX::STOPLIGHTMULTIARRAY")
  (make-package "SANDBOX::STOPLIGHTMULTIARRAY"))

(in-package "ROS")
;;//! \htmlinclude StoplightMultiArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sandbox::StoplightMultiArray
  :super ros::object
  :slots (_StoplightMultiArray _traffic_lights _deface _clock ))

(defmethod sandbox::StoplightMultiArray
  (:init
   (&key
    ((:StoplightMultiArray __StoplightMultiArray) (instance std_msgs::Header :init))
    ((:traffic_lights __traffic_lights) (let (r) (dotimes (i 0) (push (instance sandbox::Stoplight :init) r)) r))
    ((:deface __deface) 0)
    ((:clock __clock) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _StoplightMultiArray __StoplightMultiArray)
   (setq _traffic_lights __traffic_lights)
   (setq _deface (round __deface))
   (setq _clock __clock)
   self)
  (:StoplightMultiArray
   (&rest __StoplightMultiArray)
   (if (keywordp (car __StoplightMultiArray))
       (send* _StoplightMultiArray __StoplightMultiArray)
     (progn
       (if __StoplightMultiArray (setq _StoplightMultiArray (car __StoplightMultiArray)))
       _StoplightMultiArray)))
  (:traffic_lights
   (&rest __traffic_lights)
   (if (keywordp (car __traffic_lights))
       (send* _traffic_lights __traffic_lights)
     (progn
       (if __traffic_lights (setq _traffic_lights (car __traffic_lights)))
       _traffic_lights)))
  (:deface
   (&optional __deface)
   (if __deface (setq _deface __deface)) _deface)
  (:clock
   (&optional __clock)
   (if __clock (setq _clock __clock)) _clock)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _StoplightMultiArray
    (send _StoplightMultiArray :serialization-length)
    ;; sandbox/Stoplight[] _traffic_lights
    (apply #'+ (send-all _traffic_lights :serialization-length)) 4
    ;; int16 _deface
    2
    ;; int16[] _clock
    (* 2    (length _clock)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _StoplightMultiArray
       (send _StoplightMultiArray :serialize s)
     ;; sandbox/Stoplight[] _traffic_lights
     (write-long (length _traffic_lights) s)
     (dolist (elem _traffic_lights)
       (send elem :serialize s)
       )
     ;; int16 _deface
       (write-word _deface s)
     ;; int16[] _clock
     (write-long (length _clock) s)
     (dotimes (i (length _clock))
       (write-word (elt _clock i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _StoplightMultiArray
     (send _StoplightMultiArray :deserialize buf ptr-) (incf ptr- (send _StoplightMultiArray :serialization-length))
   ;; sandbox/Stoplight[] _traffic_lights
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _traffic_lights (let (r) (dotimes (i n) (push (instance sandbox::Stoplight :init) r)) r))
     (dolist (elem- _traffic_lights)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; int16 _deface
     (setq _deface (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16[] _clock
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _clock (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _clock i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(setf (get sandbox::StoplightMultiArray :md5sum-) "36040492c6f40acc8475256baa3fc1e7")
(setf (get sandbox::StoplightMultiArray :datatype-) "sandbox/StoplightMultiArray")
(setf (get sandbox::StoplightMultiArray :definition-)
      "Header StoplightMultiArray
sandbox/Stoplight[] traffic_lights
int16 deface
int16[] clock# syncronized clock for all stoplights

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

================================================================================
MSG: sandbox/Stoplight
Header Stoplight
string type # cross, street, blink warning
string direction # norht2south, east2west, up2down
int16[] colors # [red,gree,blue,custom]

")



(provide :sandbox/StoplightMultiArray "36040492c6f40acc8475256baa3fc1e7")


