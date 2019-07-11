;; Auto-generated. Do not edit!


(when (boundp 'sandbox::array)
  (if (not (find-package "SANDBOX"))
    (make-package "SANDBOX"))
  (shadow 'array (find-package "SANDBOX")))
(unless (find-package "SANDBOX::ARRAY")
  (make-package "SANDBOX::ARRAY"))

(in-package "ROS")
;;//! \htmlinclude array.msg.html


(defclass sandbox::array
  :super ros::object
  :slots (_layout _data ))

(defmethod sandbox::array
  (:init
   (&key
    ((:layout __layout) (instance sandbox::layout :init))
    ((:data __data) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _layout __layout)
   (setq _data __data)
   self)
  (:layout
   (&rest __layout)
   (if (keywordp (car __layout))
       (send* _layout __layout)
     (progn
       (if __layout (setq _layout (car __layout)))
       _layout)))
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; sandbox/layout _layout
    (send _layout :serialization-length)
    ;; int16[] _data
    (* 2    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sandbox/layout _layout
       (send _layout :serialize s)
     ;; int16[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (write-word (elt _data i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sandbox/layout _layout
     (send _layout :deserialize buf ptr-) (incf ptr- (send _layout :serialization-length))
   ;; int16[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(setf (get sandbox::array :md5sum-) "91faa4ba0e0b5a49fa10b31bb254bdd0")
(setf (get sandbox::array :datatype-) "sandbox/array")
(setf (get sandbox::array :definition-)
      "sandbox/layout layout
int16[] data # For aditional data realted

================================================================================
MSG: sandbox/layout
sandbox/dimension[] dim
int16[] clock

================================================================================
MSG: sandbox/dimension
string label # Name or id of stoplight station (Arduino)
int16[] street # Colors of RGB
int16[] cross # Colors of RGB

")



(provide :sandbox/array "91faa4ba0e0b5a49fa10b31bb254bdd0")


