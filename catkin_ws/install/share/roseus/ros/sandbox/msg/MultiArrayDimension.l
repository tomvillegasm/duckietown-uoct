;; Auto-generated. Do not edit!


(when (boundp 'sandbox::MultiArrayDimension)
  (if (not (find-package "SANDBOX"))
    (make-package "SANDBOX"))
  (shadow 'MultiArrayDimension (find-package "SANDBOX")))
(unless (find-package "SANDBOX::MULTIARRAYDIMENSION")
  (make-package "SANDBOX::MULTIARRAYDIMENSION"))

(in-package "ROS")
;;//! \htmlinclude MultiArrayDimension.msg.html


(defclass sandbox::MultiArrayDimension
  :super ros::object
  :slots (_type _direction _colors ))

(defmethod sandbox::MultiArrayDimension
  (:init
   (&key
    ((:type __type) "")
    ((:direction __direction) "")
    ((:colors __colors) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _type (string __type))
   (setq _direction (string __direction))
   (setq _colors __colors)
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:colors
   (&optional __colors)
   (if __colors (setq _colors __colors)) _colors)
  (:serialization-length
   ()
   (+
    ;; string _type
    4 (length _type)
    ;; string _direction
    4 (length _direction)
    ;; int16[] _colors
    (* 2    (length _colors)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;; string _direction
       (write-long (length _direction) s) (princ _direction s)
     ;; int16[] _colors
     (write-long (length _colors) s)
     (dotimes (i (length _colors))
       (write-word (elt _colors i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _direction
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _direction (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int16[] _colors
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _colors (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _colors i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(setf (get sandbox::MultiArrayDimension :md5sum-) "c859bfffbf71660d86da49dca5a1f3c1")
(setf (get sandbox::MultiArrayDimension :datatype-) "sandbox/MultiArrayDimension")
(setf (get sandbox::MultiArrayDimension :definition-)
      "string type # cross, street, blink warning
string direction # norht2south, east2west, up2down
int16[] colors # [red,gree,blue,custom]

")



(provide :sandbox/MultiArrayDimension "c859bfffbf71660d86da49dca5a1f3c1")


