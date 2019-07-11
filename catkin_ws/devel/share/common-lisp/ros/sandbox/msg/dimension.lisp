; Auto-generated. Do not edit!


(cl:in-package sandbox-msg)


;//! \htmlinclude dimension.msg.html

(cl:defclass <dimension> (roslisp-msg-protocol:ros-message)
  ((label
    :reader label
    :initarg :label
    :type cl:string
    :initform "")
   (street
    :reader street
    :initarg :street
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (cross
    :reader cross
    :initarg :cross
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass dimension (<dimension>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <dimension>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'dimension)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sandbox-msg:<dimension> is deprecated: use sandbox-msg:dimension instead.")))

(cl:ensure-generic-function 'label-val :lambda-list '(m))
(cl:defmethod label-val ((m <dimension>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:label-val is deprecated.  Use sandbox-msg:label instead.")
  (label m))

(cl:ensure-generic-function 'street-val :lambda-list '(m))
(cl:defmethod street-val ((m <dimension>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:street-val is deprecated.  Use sandbox-msg:street instead.")
  (street m))

(cl:ensure-generic-function 'cross-val :lambda-list '(m))
(cl:defmethod cross-val ((m <dimension>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:cross-val is deprecated.  Use sandbox-msg:cross instead.")
  (cross m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <dimension>) ostream)
  "Serializes a message object of type '<dimension>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'label))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'label))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'street))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'street))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'cross))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'cross))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <dimension>) istream)
  "Deserializes a message object of type '<dimension>"
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
  (cl:setf (cl:slot-value msg 'street) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'street)))
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
  (cl:setf (cl:slot-value msg 'cross) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'cross)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<dimension>)))
  "Returns string type for a message object of type '<dimension>"
  "sandbox/dimension")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'dimension)))
  "Returns string type for a message object of type 'dimension"
  "sandbox/dimension")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<dimension>)))
  "Returns md5sum for a message object of type '<dimension>"
  "c567be47ab17b0dffb7f0c899206810b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'dimension)))
  "Returns md5sum for a message object of type 'dimension"
  "c567be47ab17b0dffb7f0c899206810b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<dimension>)))
  "Returns full string definition for message of type '<dimension>"
  (cl:format cl:nil "string label # Name or id of stoplight station (Arduino)~%int16[] street # Colors of RGB~%int16[] cross # Colors of RGB~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'dimension)))
  "Returns full string definition for message of type 'dimension"
  (cl:format cl:nil "string label # Name or id of stoplight station (Arduino)~%int16[] street # Colors of RGB~%int16[] cross # Colors of RGB~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <dimension>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'label))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'street) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'cross) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <dimension>))
  "Converts a ROS message object to a list"
  (cl:list 'dimension
    (cl:cons ':label (label msg))
    (cl:cons ':street (street msg))
    (cl:cons ':cross (cross msg))
))
