#!/usr/bin/env python

import rospy

from std_msgs.msg import Int16MultiArray
from sandbox.msg import Stoplight, StoplightMultiArray
import time

class StreetStoplight(object):
    def __init__(slef):
        slef.n2s_red = 0
        slef.n2s_green = 0
        slef.n2s_blue = 255

        slef.e2w_red = 0
        slef.e2w_green = 0
        slef.e2w_blue = 255

    def n2s_lights(slef):
        return [slef.n2s_red,slef.n2s_green,slef.n2s_blue]

    def e2w_lights(slef):
        return [slef.e2w_red,slef.e2w_green,slef.e2w_blue]

class CrossStoplight(object):
    def __init__(slef):
        slef.n2s_red = 0
        slef.n2s_green = 0
        slef.n2s_blue = 255

        slef.e2w_red = 0
        slef.e2w_green = 0
        slef.e2w_blue = 255

    def n2s_lights(slef):
        return [slef.n2s_red,slef.n2s_green,slef.n2s_blue]

    def e2w_lights(slef):
        return [slef.e2w_red,slef.e2w_green,slef.e2w_blue]

class GodclockChronometer(object):
    def __init__(slef):
        super(GodclockChronometer, slef).__init__()
        slef.chrono = StoplightMultiArray()
        slef.chrono.godclock = [0,0]

        # slef.stoplight = CoreStoplight()

    # Extrae el valor del ultimo segundo del reloj interno de ROS
    def godclock(slef):
        print 'Godclock has been awaken'

        time = rospy.get_time()
        sec_raw = int(time%10)
        chrono = slef.chronometer(sec_raw)
        # slef.stoplight.callback(slef.chrono)

        # slef.pub_raw.publish(sec_raw)
        # slef.stoplight.pub.publish(chrono)
        print slef.chrono
        sleep(1)

    # Utiliza los valores del reloj de ROS para formar un cronometro
    def chronometer(slef,var):
        min = slef.chrono.godclock[0]
        sec = slef.chrono.godclock[1]
        if var == 0:
            sec = (sec/10)*10 + var
            sec = sec + 10
        if sec == 60:
            sec = 0
            min +=1
        else:
            sec = (sec/10)*10 + var
        slef.chrono.godclock[0] = min
        slef.chrono.godclock[1] = sec
        return slef.chrono


class RosTimeClock(object):
    def __init__(slef):
        None
        # raw = rospy.get_time()
        # sec = int(raw)
        # limit = sec%10000

class CoreStoplight(object):
    def __init__(slef):
        # slef.sub = rospy.Subscriber("uoct/godclock", Int16MultiArray, slef.callback)
        slef.pub = rospy.Publisher("uoct/stoplight/",StoplightMultiArray, queue_size=7)

        slef.street = StreetStoplight()
        slef.cross = CrossStoplight()
        slef.clock = RosTimeClock()
        slef.chrono = GodclockChronometer()

        slef.shelf = StoplightMultiArray()

        slef.book_n2s_street = Stoplight()
        slef.book_n2s_cross = Stoplight()

        slef.book_e2w_street = Stoplight()
        slef.book_e2w_cross = Stoplight()

        slef.book_n2s_street.type = 'Street'
        slef.book_n2s_street.direction = 'North to South'
        slef.book_n2s_street.colors = slef.street.n2s_lights()
        slef.shelf.traffic_lights.append(slef.book_n2s_street)

        slef.book_n2s_cross.type = 'Cross'
        slef.book_n2s_cross.direction = 'North to South'
        slef.book_n2s_cross.colors = slef.cross.n2s_lights()
        slef.shelf.traffic_lights.append(slef.book_n2s_cross)

        slef.book_e2w_street.type = 'Street'
        slef.book_e2w_street.direction = 'East to West'
        slef.book_e2w_street.colors = slef.street.e2w_lights()
        slef.shelf.traffic_lights.append(slef.book_e2w_street)

        slef.book_e2w_cross.type = 'Cross'
        slef.book_e2w_cross.direction = 'East to West'
        slef.book_e2w_street.colors = slef.cross.e2w_lights()
        slef.shelf.traffic_lights.append(slef.book_e2w_street)

    def callback(slef,msg):
        print slef.shelf
        # print slef.traffic_lights
        # print slef.message.layout
        # print ''
        # print slef.godclock.time()
        # print slef.shelf
        # print slef.shelf.layout
        # print slef.test
        # print slef.test.layout

        # time = slef.godclock.time()
        # min = time[0]
        # sec = time[1]
        #
        # # Semaforo de 30 segundos
        # if sec == 30:
        #     # Semaforo calle rojo
        #     slef.street.red = slef.on
        #     slef.street.green = 0
        #     slef.street.blue = 0
        #     slef.n2s.publish(slef.shelf)
        #
        # if sec == (30 + slef.gap):
        #     # Semaforo cruce verde
        #     slef.cross.red = 0
        #     slef.cross.green = slef.on
        #     slef.cross.blue = 0
        #     slef.n2s.publish(slef.shelf)
        #
        # if sec == 0:
        #     # Semaforo cruce rojo
        #     slef.cross.red = slef.on
        #     slef.cross.green = 0
        #     slef.cross.blue = 0
        #     slef.n2s.publish(slef.shelf)
        #
        # if sec == (0 + slef.gap):
        #     # Semaforo calle verde
        #     slef.street.red = 0
        #     slef.street.green = slef.on
        #     slef.street.blue = 0
        #     slef.n2s.publish(slef.shelf)

def main():
    rospy.init_node('template')
    Instance = GodclockChronometer()
    Instance.godclock()
    # Mipper = CoreStoplight()
    # Mipper.callback(None)

    rospy.spin()

if __name__ =='__main__':
    main()
