; Auto-generated. Do not edit!


(cl:in-package sandbox-msg)


;//! \htmlinclude MultiArraySubDimension.msg.html

(cl:defclass <MultiArraySubDimension> (roslisp-msg-protocol:ros-message)
  ((label
    :reader label
    :initarg :label
    :type cl:string
    :initform "")
   (colors
    :reader colors
    :initarg :colors
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass MultiArraySubDimension (<MultiArraySubDimension>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MultiArraySubDimension>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MultiArraySubDimension)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sandbox-msg:<MultiArraySubDimension> is deprecated: use sandbox-msg:MultiArraySubDimension instead.")))

(cl:ensure-generic-function 'label-val :lambda-list '(m))
(cl:defmethod label-val ((m <MultiArraySubDimension>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:label-val is deprecated.  Use sandbox-msg:label instead.")
  (label m))

(cl:ensure-generic-function 'colors-val :lambda-list '(m))
(cl:defmethod colors-val ((m <MultiArraySubDimension>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:colors-val is deprecated.  Use sandbox-msg:colors instead.")
  (colors m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MultiArraySubDimension>) ostream)
  "Serializes a message object of type '<MultiArraySubDimension>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'label))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'label))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MultiArraySubDimension>) istream)
  "Deserializes a message object of type '<MultiArraySubDimension>"
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
  (cl:setf (cl:slot-value msg 'colors) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'colors)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MultiArraySubDimension>)))
  "Returns string type for a message object of type '<MultiArraySubDimension>"
  "sandbox/MultiArraySubDimension")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MultiArraySubDimension)))
  "Returns string type for a message object of type 'MultiArraySubDimension"
  "sandbox/MultiArraySubDimension")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MultiArraySubDimension>)))
  "Returns md5sum for a message object of type '<MultiArraySubDimension>"
  "6def1837502a9057eabbae76543b5b87")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MultiArraySubDimension)))
  "Returns md5sum for a message object of type 'MultiArraySubDimension"
  "6def1837502a9057eabbae76543b5b87")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MultiArraySubDimension>)))
  "Returns full string definition for message of type '<MultiArraySubDimension>"
  (cl:format cl:nil "string label # cross, street, blink warning~%int16[] colors # [red,gree,blue,custom]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MultiArraySubDimension)))
  "Returns full string definition for message of type 'MultiArraySubDimension"
  (cl:format cl:nil "string label # cross, street, blink warning~%int16[] colors # [red,gree,blue,custom]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MultiArraySubDimension>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'label))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'colors) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MultiArraySubDimension>))
  "Converts a ROS message object to a list"
  (cl:list 'MultiArraySubDimension
    (cl:cons ':label (label msg))
    (cl:cons ':colors (colors msg))
))
