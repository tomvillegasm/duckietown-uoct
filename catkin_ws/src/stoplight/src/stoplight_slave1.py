#!/usr/bin/env python

import rospy
from std_msgs.msg import Empty, String
from time import sleep

rospy.init_node('light')
sub = rospy.Subscriber('duckietown-uoct/stoplight/master', slave1, stoplight_slave1)
pub = rospy.Publisher('duckietown-uoct/stoplight/slave1', Empty, queue_size=7)

def stoplight_slave1(msg):

i=1
while not rospy.is_shutdown():
    if i==1:
        pub.publish()
        pub.publish()
    else:
        print 'Verde B' + str(i-1)
        pub.publish()
        sleep(5)
        print 'Rojo B' + str(i-1)
        pub.publish()
        print '-------'
        sleep(5)
        i+=1
