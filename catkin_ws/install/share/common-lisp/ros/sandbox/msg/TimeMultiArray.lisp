; Auto-generated. Do not edit!


(cl:in-package sandbox-msg)


;//! \htmlinclude TimeMultiArray.msg.html

(cl:defclass <TimeMultiArray> (roslisp-msg-protocol:ros-message)
  ((StoplightTime
    :reader StoplightTime
    :initarg :StoplightTime
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (minutes
    :reader minutes
    :initarg :minutes
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (seconds
    :reader seconds
    :initarg :seconds
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass TimeMultiArray (<TimeMultiArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TimeMultiArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TimeMultiArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sandbox-msg:<TimeMultiArray> is deprecated: use sandbox-msg:TimeMultiArray instead.")))

(cl:ensure-generic-function 'StoplightTime-val :lambda-list '(m))
(cl:defmethod StoplightTime-val ((m <TimeMultiArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:StoplightTime-val is deprecated.  Use sandbox-msg:StoplightTime instead.")
  (StoplightTime m))

(cl:ensure-generic-function 'minutes-val :lambda-list '(m))
(cl:defmethod minutes-val ((m <TimeMultiArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:minutes-val is deprecated.  Use sandbox-msg:minutes instead.")
  (minutes m))

(cl:ensure-generic-function 'seconds-val :lambda-list '(m))
(cl:defmethod seconds-val ((m <TimeMultiArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:seconds-val is deprecated.  Use sandbox-msg:seconds instead.")
  (seconds m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TimeMultiArray>) ostream)
  "Serializes a message object of type '<TimeMultiArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'StoplightTime) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'minutes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'minutes))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'seconds))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'seconds))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TimeMultiArray>) istream)
  "Deserializes a message object of type '<TimeMultiArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'StoplightTime) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'minutes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'minutes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'seconds) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'seconds)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TimeMultiArray>)))
  "Returns string type for a message object of type '<TimeMultiArray>"
  "sandbox/TimeMultiArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TimeMultiArray)))
  "Returns string type for a message object of type 'TimeMultiArray"
  "sandbox/TimeMultiArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TimeMultiArray>)))
  "Returns md5sum for a message object of type '<TimeMultiArray>"
  "8f037166f662f8756df277bb1c73f274")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TimeMultiArray)))
  "Returns md5sum for a message object of type 'TimeMultiArray"
  "8f037166f662f8756df277bb1c73f274")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TimeMultiArray>)))
  "Returns full string definition for message of type '<TimeMultiArray>"
  (cl:format cl:nil "Header StoplightTime~%int16[] minutes~%int16[] seconds~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TimeMultiArray)))
  "Returns full string definition for message of type 'TimeMultiArray"
  (cl:format cl:nil "Header StoplightTime~%int16[] minutes~%int16[] seconds~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TimeMultiArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'StoplightTime))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'minutes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'seconds) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TimeMultiArray>))
  "Converts a ROS message object to a list"
  (cl:list 'TimeMultiArray
    (cl:cons ':StoplightTime (StoplightTime msg))
    (cl:cons ':minutes (minutes msg))
    (cl:cons ':seconds (seconds msg))
))
