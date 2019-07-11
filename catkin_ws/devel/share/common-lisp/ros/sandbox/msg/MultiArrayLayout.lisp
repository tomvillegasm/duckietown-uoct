; Auto-generated. Do not edit!


(cl:in-package sandbox-msg)


;//! \htmlinclude MultiArrayLayout.msg.html

(cl:defclass <MultiArrayLayout> (roslisp-msg-protocol:ros-message)
  ((stoplights
    :reader stoplights
    :initarg :stoplights
    :type (cl:vector sandbox-msg:MultiArraySubDimension)
   :initform (cl:make-array 0 :element-type 'sandbox-msg:MultiArraySubDimension :initial-element (cl:make-instance 'sandbox-msg:MultiArraySubDimension)))
   (deface
    :reader deface
    :initarg :deface
    :type cl:fixnum
    :initform 0))
)

(cl:defclass MultiArrayLayout (<MultiArrayLayout>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MultiArrayLayout>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MultiArrayLayout)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sandbox-msg:<MultiArrayLayout> is deprecated: use sandbox-msg:MultiArrayLayout instead.")))

(cl:ensure-generic-function 'stoplights-val :lambda-list '(m))
(cl:defmethod stoplights-val ((m <MultiArrayLayout>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:stoplights-val is deprecated.  Use sandbox-msg:stoplights instead.")
  (stoplights m))

(cl:ensure-generic-function 'deface-val :lambda-list '(m))
(cl:defmethod deface-val ((m <MultiArrayLayout>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sandbox-msg:deface-val is deprecated.  Use sandbox-msg:deface instead.")
  (deface m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MultiArrayLayout>) ostream)
  "Serializes a message object of type '<MultiArrayLayout>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'stoplights))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'stoplights))
  (cl:let* ((signed (cl:slot-value msg 'deface)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MultiArrayLayout>) istream)
  "Deserializes a message object of type '<MultiArrayLayout>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'stoplights) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'stoplights)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sandbox-msg:MultiArraySubDimension))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'deface) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MultiArrayLayout>)))
  "Returns string type for a message object of type '<MultiArrayLayout>"
  "sandbox/MultiArrayLayout")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MultiArrayLayout)))
  "Returns string type for a message object of type 'MultiArrayLayout"
  "sandbox/MultiArrayLayout")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MultiArrayLayout>)))
  "Returns md5sum for a message object of type '<MultiArrayLayout>"
  "c71496406d4b1a871cb3ce7d7daa62da")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MultiArrayLayout)))
  "Returns md5sum for a message object of type 'MultiArrayLayout"
  "c71496406d4b1a871cb3ce7d7daa62da")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MultiArrayLayout>)))
  "Returns full string definition for message of type '<MultiArrayLayout>"
  (cl:format cl:nil "sandbox/MultiArraySubDimension[] stoplights # colection of stoplights to send message~%int16 deface~%~%================================================================================~%MSG: sandbox/MultiArraySubDimension~%string label # cross, street, blink warning~%int16[] colors # [red,gree,blue,custom]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MultiArrayLayout)))
  "Returns full string definition for message of type 'MultiArrayLayout"
  (cl:format cl:nil "sandbox/MultiArraySubDimension[] stoplights # colection of stoplights to send message~%int16 deface~%~%================================================================================~%MSG: sandbox/MultiArraySubDimension~%string label # cross, street, blink warning~%int16[] colors # [red,gree,blue,custom]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MultiArrayLayout>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'stoplights) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MultiArrayLayout>))
  "Converts a ROS message object to a list"
  (cl:list 'MultiArrayLayout
    (cl:cons ':stoplights (stoplights msg))
    (cl:cons ':deface (deface msg))
))
