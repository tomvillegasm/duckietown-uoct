#!/usr/bin/env python

import rospy #importar ros para python
from std_msgs.msg import String, Int16 # importar mensajes de ROS tipo String y tipo Int32
from geometry_msgs.msg import Twist # importar mensajes de ROS tipo geometry / Twist
from sensor_msgs.msg import Image # importar mensajes de ROS tipo Image
import cv2 # importar libreria opencv
from cv_bridge import CvBridge # importar convertidor de formato de imagenes
import numpy as np # importar libreria numpy

rospy.init_node('redlight_detector')

pub = rospy.Publisher('uoct/stoplight/stop', Int16, queue_size=7)

def stop(msg):
    # Change RBG yo HSV
    img = CvBridge.imgmsg_to_cv2("bgr8",msg)
    img_conv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    # Create filter and apply mask
    msk = cv2.inRange(img_conv,np.array([0,175,175]),np.array([30,255,255]))
    img_msked = cv2.bitwise_and(img_conv,img_conv,mask=msk)
    # Noise reduction of masked image
    kernel = np.ones((5,5), np.uint8)
    img_out = cv2.erode(img_out, kernel, iterations = 1)
    # Generate blob
    _, contours, hierarchy = cv2.findContourns(msk, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
    x1,y1,x2,y2 = cv2.boundingRect(contours)
    cv2.rectangle(img_out, (0,y1),(0,y2),(0,0,0),2)

    areas = []
    for c in contours:
        areas.append(cv2.contourArea(c))

	msg = bridge.cv2_to_imgmsg(img_final,"bgr8")
#	img_out = cv2.cvtColor(img_out, cv2.COLOR_HSV2BGR)
	self.pub.publish(msg)

sub = rospy.Subscriber('usb_cam/image_raw', Image, stop)

rospy.spin()
