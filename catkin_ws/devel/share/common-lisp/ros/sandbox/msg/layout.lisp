; Auto-generated. Do not edit!


(cl:in-package sandbox-msg)


;//! \htmlinclude layout.msg.html

(cl:defclass <layout> (roslisp-msg-protocol:ros-message)
  ((dim
    :reader dim
    :initarg :dim
    :type (cl:vector sandbox-msg:dimension)
   :initform (cl:make-array 0 :element-type 'sandbox-msg:dimension :initial-element (cl:make-instance 'sandbox-msg:dimension)))
   (clock
    :reader clock
    :initarg :clock
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass layout (<layout>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <layout>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'layout)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sandbox-msg:<layout> is deprecated: use sandbox-msg:layout instead.")))

(cl:ensure-generic-function 'dim-val :lambda-list '(m))
(cl:defmethod dim-val ((m <layout>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:dim-val is deprecated.  Use sandbox-msg:dim instead.")
  (dim m))

(cl:ensure-generic-function 'clock-val :lambda-list '(m))
(cl:defmethod clock-val ((m <layout>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:clock-val is deprecated.  Use sandbox-msg:clock instead.")
  (clock m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <layout>) ostream)
  "Serializes a message object of type '<layout>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'dim))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'dim))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <layout>) istream)
  "Deserializes a message object of type '<layout>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'dim) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'dim)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sandbox-msg:dimension))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<layout>)))
  "Returns string type for a message object of type '<layout>"
  "sandbox/layout")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'layout)))
  "Returns string type for a message object of type 'layout"
  "sandbox/layout")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<layout>)))
  "Returns md5sum for a message object of type '<layout>"
  "f6424ad02d7a0d576d10eac3878f9649")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'layout)))
  "Returns md5sum for a message object of type 'layout"
  "f6424ad02d7a0d576d10eac3878f9649")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<layout>)))
  "Returns full string definition for message of type '<layout>"
  (cl:format cl:nil "sandbox/dimension[] dim~%int16[] clock~%~%================================================================================~%MSG: sandbox/dimension~%string label # Name or id of stoplight station (Arduino)~%int16[] street # Colors of RGB~%int16[] cross # Colors of RGB~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'layout)))
  "Returns full string definition for message of type 'layout"
  (cl:format cl:nil "sandbox/dimension[] dim~%int16[] clock~%~%================================================================================~%MSG: sandbox/dimension~%string label # Name or id of stoplight station (Arduino)~%int16[] street # Colors of RGB~%int16[] cross # Colors of RGB~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <layout>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'dim) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'clock) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <layout>))
  "Converts a ROS message object to a list"
  (cl:list 'layout
    (cl:cons ':dim (dim msg))
    (cl:cons ':clock (clock msg))
))
