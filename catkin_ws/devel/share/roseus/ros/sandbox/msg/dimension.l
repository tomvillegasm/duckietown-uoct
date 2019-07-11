;; Auto-generated. Do not edit!


(when (boundp 'sandbox::dimension)
  (if (not (find-package "SANDBOX"))
    (make-package "SANDBOX"))
  (shadow 'dimension (find-package "SANDBOX")))
(unless (find-package "SANDBOX::DIMENSION")
  (make-package "SANDBOX::DIMENSION"))

(in-package "ROS")
;;//! \htmlinclude dimension.msg.html


(defclass sandbox::dimension
  :super ros::object
  :slots (_label _street _cross ))

(defmethod sandbox::dimension
  (:init
   (&key
    ((:label __label) "")
    ((:street __street) (make-array 0 :initial-element 0 :element-type :integer))
    ((:cross __cross) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _label (string __label))
   (setq _street __street)
   (setq _cross __cross)
   self)
  (:label
   (&optional __label)
   (if __label (setq _label __label)) _label)
  (:street
   (&optional __street)
   (if __street (setq _street __street)) _street)
  (:cross
   (&optional __cross)
   (if __cross (setq _cross __cross)) _cross)
  (:serialization-length
   ()
   (+
    ;; string _label
    4 (length _label)
    ;; int16[] _street
    (* 2    (length _street)) 4
    ;; int16[] _cross
    (* 2    (length _cross)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _label
       (write-long (length _label) s) (princ _label s)
     ;; int16[] _street
     (write-long (length _street) s)
     (dotimes (i (length _street))
       (write-word (elt _street i) s)
       )
     ;; int16[] _cross
     (write-long (length _cross) s)
     (dotimes (i (length _cross))
       (write-word (elt _cross i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _label
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _label (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int16[] _street
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _street (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _street i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; int16[] _cross
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _cross (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _cross i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(setf (get sandbox::dimension :md5sum-) "c567be47ab17b0dffb7f0c899206810b")
(setf (get sandbox::dimension :datatype-) "sandbox/dimension")
(setf (get sandbox::dimension :definition-)
      "string label # Name or id of stoplight station (Arduino)
int16[] street # Colors of RGB
int16[] cross # Colors of RGB

")



(provide :sandbox/dimension "c567be47ab17b0dffb7f0c899206810b")


