#!/usr/bin/env python

import rospy
from std_msgs.msg import Int16MultiArray, Int16
import time

class clock(object):
    def __init__(slef):
        super(clock,slef).__init__()
        while not rospy.is_shutdown():
            raw = rospy.get_time()
            human = time.localtime(raw)
            print human.tm_hour, human.tm_min, human.tm_sec
            time.sleep(1)

def main():
    rospy.init_node('UOCT_clock')
    Instance = clock()
    rospy.spin()

# Ejecucion inicial
if __name__ =='__main__':
        main()
