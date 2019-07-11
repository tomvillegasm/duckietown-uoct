; Auto-generated. Do not edit!


(cl:in-package sandbox-msg)


;//! \htmlinclude mipper.msg.html

(cl:defclass <mipper> (roslisp-msg-protocol:ros-message)
  ((label
    :reader label
    :initarg :label
    :type cl:string
    :initform "")
   (data
    :reader data
    :initarg :data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass mipper (<mipper>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mipper>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mipper)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sandbox-msg:<mipper> is deprecated: use sandbox-msg:mipper instead.")))

(cl:ensure-generic-function 'label-val :lambda-list '(m))
(cl:defmethod label-val ((m <mipper>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:label-val is deprecated.  Use sandbox-msg:label instead.")
  (label m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <mipper>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:data-val is deprecated.  Use sandbox-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mipper>) ostream)
  "Serializes a message object of type '<mipper>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'label))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'label))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mipper>) istream)
  "Deserializes a message object of type '<mipper>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'label) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'label) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mipper>)))
  "Returns string type for a message object of type '<mipper>"
  "sandbox/mipper")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mipper)))
  "Returns string type for a message object of type 'mipper"
  "sandbox/mipper")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mipper>)))
  "Returns md5sum for a message object of type '<mipper>"
  "03274f755f3fa14034497c515fc2e37a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mipper)))
  "Returns md5sum for a message object of type 'mipper"
  "03274f755f3fa14034497c515fc2e37a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mipper>)))
  "Returns full string definition for message of type '<mipper>"
  (cl:format cl:nil "string label~%int16[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mipper)))
  "Returns full string definition for message of type 'mipper"
  (cl:format cl:nil "string label~%int16[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mipper>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'label))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mipper>))
  "Converts a ROS message object to a list"
  (cl:list 'mipper
    (cl:cons ':label (label msg))
    (cl:cons ':data (data msg))
))
