; Auto-generated. Do not edit!


(cl:in-package sandbox-msg)


;//! \htmlinclude Stoplight.msg.html

(cl:defclass <Stoplight> (roslisp-msg-protocol:ros-message)
  ((Stoplight
    :reader Stoplight
    :initarg :Stoplight
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (type
    :reader type
    :initarg :type
    :type cl:string
    :initform "")
   (direction
    :reader direction
    :initarg :direction
    :type cl:string
    :initform "")
   (colors
    :reader colors
    :initarg :colors
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass Stoplight (<Stoplight>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Stoplight>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Stoplight)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sandbox-msg:<Stoplight> is deprecated: use sandbox-msg:Stoplight instead.")))

(cl:ensure-generic-function 'Stoplight-val :lambda-list '(m))
(cl:defmethod Stoplight-val ((m <Stoplight>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:Stoplight-val is deprecated.  Use sandbox-msg:Stoplight instead.")
  (Stoplight m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <Stoplight>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:type-val is deprecated.  Use sandbox-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <Stoplight>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:direction-val is deprecated.  Use sandbox-msg:direction instead.")
  (direction m))

(cl:ensure-generic-function 'colors-val :lambda-list '(m))
(cl:defmethod colors-val ((m <Stoplight>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:colors-val is deprecated.  Use sandbox-msg:colors instead.")
  (colors m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Stoplight>) ostream)
  "Serializes a message object of type '<Stoplight>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Stoplight) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'type))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'direction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'direction))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'colors))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'colors))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Stoplight>) istream)
  "Deserializes a message object of type '<Stoplight>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Stoplight) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'direction) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'direction) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'colors) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'colors)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Stoplight>)))
  "Returns string type for a message object of type '<Stoplight>"
  "sandbox/Stoplight")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Stoplight)))
  "Returns string type for a message object of type 'Stoplight"
  "sandbox/Stoplight")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Stoplight>)))
  "Returns md5sum for a message object of type '<Stoplight>"
  "6654bda664e47f8222314d4f89a55a15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Stoplight)))
  "Returns md5sum for a message object of type 'Stoplight"
  "6654bda664e47f8222314d4f89a55a15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Stoplight>)))
  "Returns full string definition for message of type '<Stoplight>"
  (cl:format cl:nil "Header Stoplight~%string type # cross, street, blink warning~%string direction # norht2south, east2west, up2down~%int16[] colors # [red,gree,blue,custom]~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Stoplight)))
  "Returns full string definition for message of type 'Stoplight"
  (cl:format cl:nil "Header Stoplight~%string type # cross, street, blink warning~%string direction # norht2south, east2west, up2down~%int16[] colors # [red,gree,blue,custom]~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Stoplight>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Stoplight))
     4 (cl:length (cl:slot-value msg 'type))
     4 (cl:length (cl:slot-value msg 'direction))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'colors) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Stoplight>))
  "Converts a ROS message object to a list"
  (cl:list 'Stoplight
    (cl:cons ':Stoplight (Stoplight msg))
    (cl:cons ':type (type msg))
    (cl:cons ':direction (direction msg))
    (cl:cons ':colors (colors msg))
))
