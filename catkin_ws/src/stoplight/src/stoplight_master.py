#!/usr/bin/env python

import rospy
from std_msgs.msg import Empty, String, Int16
from time import sleep

rospy.init_node('stoplight_master')
pub = rospy.Publisher('uoct/stoplight/master', Int16, queue_size=1)

# RGB == 012
while not rospy.is_shutdown():
    pub.publish(1)
    sleep(5)
    pub.publish(2)
    sleep(5)
    pub.publish(0)
    sleep(5)
