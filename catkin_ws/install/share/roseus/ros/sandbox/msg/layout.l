;; Auto-generated. Do not edit!


(when (boundp 'sandbox::layout)
  (if (not (find-package "SANDBOX"))
    (make-package "SANDBOX"))
  (shadow 'layout (find-package "SANDBOX")))
(unless (find-package "SANDBOX::LAYOUT")
  (make-package "SANDBOX::LAYOUT"))

(in-package "ROS")
;;//! \htmlinclude layout.msg.html


(defclass sandbox::layout
  :super ros::object
  :slots (_dim _clock ))

(defmethod sandbox::layout
  (:init
   (&key
    ((:dim __dim) (let (r) (dotimes (i 0) (push (instance sandbox::dimension :init) r)) r))
    ((:clock __clock) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _dim __dim)
   (setq _clock __clock)
   self)
  (:dim
   (&rest __dim)
   (if (keywordp (car __dim))
       (send* _dim __dim)
     (progn
       (if __dim (setq _dim (car __dim)))
       _dim)))
  (:clock
   (&optional __clock)
   (if __clock (setq _clock __clock)) _clock)
  (:serialization-length
   ()
   (+
    ;; sandbox/dimension[] _dim
    (apply #'+ (send-all _dim :serialization-length)) 4
    ;; int16[] _clock
    (* 2    (length _clock)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sandbox/dimension[] _dim
     (write-long (length _dim) s)
     (dolist (elem _dim)
       (send elem :serialize s)
       )
     ;; int16[] _clock
     (write-long (length _clock) s)
     (dotimes (i (length _clock))
       (write-word (elt _clock i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sandbox/dimension[] _dim
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _dim (let (r) (dotimes (i n) (push (instance sandbox::dimension :init) r)) r))
     (dolist (elem- _dim)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; int16[] _clock
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _clock (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _clock i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(setf (get sandbox::layout :md5sum-) "f6424ad02d7a0d576d10eac3878f9649")
(setf (get sandbox::layout :datatype-) "sandbox/layout")
(setf (get sandbox::layout :definition-)
      "sandbox/dimension[] dim
int16[] clock

================================================================================
MSG: sandbox/dimension
string label # Name or id of stoplight station (Arduino)
int16[] street # Colors of RGB
int16[] cross # Colors of RGB

")



(provide :sandbox/layout "f6424ad02d7a0d576d10eac3878f9649")


