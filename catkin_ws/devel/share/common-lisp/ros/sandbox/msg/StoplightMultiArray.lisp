; Auto-generated. Do not edit!


(cl:in-package sandbox-msg)


;//! \htmlinclude StoplightMultiArray.msg.html

(cl:defclass <StoplightMultiArray> (roslisp-msg-protocol:ros-message)
  ((StoplightMultiArray
    :reader StoplightMultiArray
    :initarg :StoplightMultiArray
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (traffic_lights
    :reader traffic_lights
    :initarg :traffic_lights
    :type (cl:vector sandbox-msg:Stoplight)
   :initform (cl:make-array 0 :element-type 'sandbox-msg:Stoplight :initial-element (cl:make-instance 'sandbox-msg:Stoplight)))
   (deface
    :reader deface
    :initarg :deface
    :type cl:fixnum
    :initform 0)
   (clock
    :reader clock
    :initarg :clock
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass StoplightMultiArray (<StoplightMultiArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StoplightMultiArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StoplightMultiArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sandbox-msg:<StoplightMultiArray> is deprecated: use sandbox-msg:StoplightMultiArray instead.")))

(cl:ensure-generic-function 'StoplightMultiArray-val :lambda-list '(m))
(cl:defmethod StoplightMultiArray-val ((m <StoplightMultiArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:StoplightMultiArray-val is deprecated.  Use sandbox-msg:StoplightMultiArray instead.")
  (StoplightMultiArray m))

(cl:ensure-generic-function 'traffic_lights-val :lambda-list '(m))
(cl:defmethod traffic_lights-val ((m <StoplightMultiArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:traffic_lights-val is deprecated.  Use sandbox-msg:traffic_lights instead.")
  (traffic_lights m))

(cl:ensure-generic-function 'deface-val :lambda-list '(m))
(cl:defmethod deface-val ((m <StoplightMultiArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:deface-val is deprecated.  Use sandbox-msg:deface instead.")
  (deface m))

(cl:ensure-generic-function 'clock-val :lambda-list '(m))
(cl:defmethod clock-val ((m <StoplightMultiArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:clock-val is deprecated.  Use sandbox-msg:clock instead.")
  (clock m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StoplightMultiArray>) ostream)
  "Serializes a message object of type '<StoplightMultiArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'StoplightMultiArray) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'traffic_lights))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'traffic_lights))
  (cl:let* ((signed (cl:slot-value msg 'deface)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'clock))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'clock))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StoplightMultiArray>) istream)
  "Deserializes a message object of type '<StoplightMultiArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'StoplightMultiArray) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'traffic_lights) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'traffic_lights)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sandbox-msg:Stoplight))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'deface) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'clock) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'clock)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StoplightMultiArray>)))
  "Returns string type for a message object of type '<StoplightMultiArray>"
  "sandbox/StoplightMultiArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StoplightMultiArray)))
  "Returns string type for a message object of type 'StoplightMultiArray"
  "sandbox/StoplightMultiArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StoplightMultiArray>)))
  "Returns md5sum for a message object of type '<StoplightMultiArray>"
  "36040492c6f40acc8475256baa3fc1e7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StoplightMultiArray)))
  "Returns md5sum for a message object of type 'StoplightMultiArray"
  "36040492c6f40acc8475256baa3fc1e7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StoplightMultiArray>)))
  "Returns full string definition for message of type '<StoplightMultiArray>"
  (cl:format cl:nil "Header StoplightMultiArray~%sandbox/Stoplight[] traffic_lights~%int16 deface~%int16[] clock# syncronized clock for all stoplights~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sandbox/Stoplight~%Header Stoplight~%string type # cross, street, blink warning~%string direction # norht2south, east2west, up2down~%int16[] colors # [red,gree,blue,custom]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StoplightMultiArray)))
  "Returns full string definition for message of type 'StoplightMultiArray"
  (cl:format cl:nil "Header StoplightMultiArray~%sandbox/Stoplight[] traffic_lights~%int16 deface~%int16[] clock# syncronized clock for all stoplights~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sandbox/Stoplight~%Header Stoplight~%string type # cross, street, blink warning~%string direction # norht2south, east2west, up2down~%int16[] colors # [red,gree,blue,custom]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StoplightMultiArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'StoplightMultiArray))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'traffic_lights) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     2
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'clock) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StoplightMultiArray>))
  "Converts a ROS message object to a list"
  (cl:list 'StoplightMultiArray
    (cl:cons ':StoplightMultiArray (StoplightMultiArray msg))
    (cl:cons ':traffic_lights (traffic_lights msg))
    (cl:cons ':deface (deface msg))
    (cl:cons ':clock (clock msg))
))
