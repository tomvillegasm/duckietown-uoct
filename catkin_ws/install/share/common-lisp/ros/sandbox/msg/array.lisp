; Auto-generated. Do not edit!


(cl:in-package sandbox-msg)


;//! \htmlinclude array.msg.html

(cl:defclass <array> (roslisp-msg-protocol:ros-message)
  ((layout
    :reader layout
    :initarg :layout
    :type sandbox-msg:layout
    :initform (cl:make-instance 'sandbox-msg:layout))
   (data
    :reader data
    :initarg :data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass array (<array>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <array>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'array)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sandbox-msg:<array> is deprecated: use sandbox-msg:array instead.")))

(cl:ensure-generic-function 'layout-val :lambda-list '(m))
(cl:defmethod layout-val ((m <array>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:layout-val is deprecated.  Use sandbox-msg:layout instead.")
  (layout m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <array>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:data-val is deprecated.  Use sandbox-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <array>) ostream)
  "Serializes a message object of type '<array>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'layout) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <array>) istream)
  "Deserializes a message object of type '<array>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'layout) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<array>)))
  "Returns string type for a message object of type '<array>"
  "sandbox/array")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'array)))
  "Returns string type for a message object of type 'array"
  "sandbox/array")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<array>)))
  "Returns md5sum for a message object of type '<array>"
  "91faa4ba0e0b5a49fa10b31bb254bdd0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'array)))
  "Returns md5sum for a message object of type 'array"
  "91faa4ba0e0b5a49fa10b31bb254bdd0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<array>)))
  "Returns full string definition for message of type '<array>"
  (cl:format cl:nil "sandbox/layout layout~%int16[] data # For aditional data realted~%~%================================================================================~%MSG: sandbox/layout~%sandbox/dimension[] dim~%int16[] clock~%~%================================================================================~%MSG: sandbox/dimension~%string label # Name or id of stoplight station (Arduino)~%int16[] street # Colors of RGB~%int16[] cross # Colors of RGB~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'array)))
  "Returns full string definition for message of type 'array"
  (cl:format cl:nil "sandbox/layout layout~%int16[] data # For aditional data realted~%~%================================================================================~%MSG: sandbox/layout~%sandbox/dimension[] dim~%int16[] clock~%~%================================================================================~%MSG: sandbox/dimension~%string label # Name or id of stoplight station (Arduino)~%int16[] street # Colors of RGB~%int16[] cross # Colors of RGB~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <array>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'layout))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <array>))
  "Converts a ROS message object to a list"
  (cl:list 'array
    (cl:cons ':layout (layout msg))
    (cl:cons ':data (data msg))
))
