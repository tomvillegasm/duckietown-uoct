#!/usr/bin/env python

import rospy
from std_msgs.msg import Empty, String
from time import sleep

rospy.init_node('stoplight_master')
pub = rospy.Publisher('duckietown-uoct/stoplight/master', Empty, queue_size=7)

i=1
while not rospy.is_shutdown():
    print 'Rojo A ' + str(i)
    pub.publish()
    sleep(5)
    print 'Verde A' + str(i)
    pub.publish()
    print '-------'
    sleep(5)
    i+=1
