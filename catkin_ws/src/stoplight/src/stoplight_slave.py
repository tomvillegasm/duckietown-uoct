#!/usr/bin/env python

import rospy
from std_msgs.msg import Empty, String, Int16
from time import sleep

rospy.init_node('traffic_slave')
pub = rospy.Publisher('uoct/stoplight/slave', Int16, queue_size=7)

# RGB == 012
def cross(msg):
    if msg.data == 0:
        pub.publish(2)
    if msg.data == 1:
        pub.publish(0)

sub = rospy.Subscriber('uoct/stoplight/master', Int16, cross)

while not rospy.is_shutdown():
    cross()
