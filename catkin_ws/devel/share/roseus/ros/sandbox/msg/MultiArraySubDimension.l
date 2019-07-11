;; Auto-generated. Do not edit!


(when (boundp 'sandbox::MultiArraySubDimension)
  (if (not (find-package "SANDBOX"))
    (make-package "SANDBOX"))
  (shadow 'MultiArraySubDimension (find-package "SANDBOX")))
(unless (find-package "SANDBOX::MULTIARRAYSUBDIMENSION")
  (make-package "SANDBOX::MULTIARRAYSUBDIMENSION"))

(in-package "ROS")
;;//! \htmlinclude MultiArraySubDimension.msg.html


(defclass sandbox::MultiArraySubDimension
  :super ros::object
  :slots (_label _colors ))

(defmethod sandbox::MultiArraySubDimension
  (:init
   (&key
    ((:label __label) "")
    ((:colors __colors) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _label (string __label))
   (setq _colors __colors)
   self)
  (:label
   (&optional __label)
   (if __label (setq _label __label)) _label)
  (:colors
   (&optional __colors)
   (if __colors (setq _colors __colors)) _colors)
  (:serialization-length
   ()
   (+
    ;; string _label
    4 (length _label)
    ;; int16[] _colors
    (* 2    (length _colors)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _label
       (write-long (length _label) s) (princ _label s)
     ;; int16[] _colors
     (write-long (length _colors) s)
     (dotimes (i (length _colors))
       (write-word (elt _colors i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _label
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _label (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
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

(setf (get sandbox::MultiArraySubDimension :md5sum-) "6def1837502a9057eabbae76543b5b87")
(setf (get sandbox::MultiArraySubDimension :datatype-) "sandbox/MultiArraySubDimension")
(setf (get sandbox::MultiArraySubDimension :definition-)
      "string label # cross, street, blink warning
int16[] colors # [red,gree,blue,custom]

")



(provide :sandbox/MultiArraySubDimension "6def1837502a9057eabbae76543b5b87")


