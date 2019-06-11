#!/usr/bin/env python

import rospy
from std_msgs.msg import Empty, String
from time import sleep

rospy.init_node('blink_basic')
pub = rospy.Publisher('/duckietown-uoct/stoplight/blink', Empty, queue_size=7)

while not rospy.is_shutdown():
    print 'Toggle'
    pub.publish()
    # rospy.rate(10)
    sleep(1)
# ros.rate()
# rospy.spin()
