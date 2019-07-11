#!/usr/bin/env python

import rospy
from std_msgs.msg import Empty, String, Int16
from time import sleep

rospy.init_node('traffic_master')
pub = rospy.Publisher('uoct/stoplight/master', Int16, queue_size=7)

# RGB == 012
while not rospy.is_shutdown():
    pub.publish(1)
    sleep(5)
    pub.publish(0)
    sleep(5)
