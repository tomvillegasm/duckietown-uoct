#!/usr/bin/env python

# Importa elementos ROS para python
import rospy
# Importa desde el elemento mensaje el tipo de mensaje a intercambiar
from std_msgs.msg import Int16MultiArray, Int16
# Importa liberria python para hacer delay
from time import sleep

class Template(object):
    def __init__(slef):
        super(Template, slef).__init__()
        slef.clock = rospy.Publisher("uoct/stoplight/godclock", Int16MultiArray, queue_size=7)
        # slef.pub_raw = rospy.Publisher("uoct/stoplight/godclock/raw", Int16, queue_size=7)
        slef.chrono = Int16MultiArray()
        slef.chrono.data = [0,0]

    # Extrae el valor del ultimo segundo del reloj interno de ROS
    def godclock(slef):
        print 'Godclock has been awaken'
        while not rospy.is_shutdown():
            time = rospy.get_time()
            sec_raw = int(time%10)
            chrono = slef.chronometer(sec_raw)
            # slef.pub_raw.publish(sec_raw)
            slef.clock.publish(chrono)
            sleep(1)

    # Utiliza los valores del reloj de ROS para formar un cronometro
    def chronometer(slef,var):
        min = slef.chrono.data[0]
        sec = slef.chrono.data[1]
        if var == 0:
            sec = (sec/10)*10 + var
            sec = sec + 10
        if sec == 60:
            sec = 0
            min +=1
        else:
            sec = (sec/10)*10 + var
        slef.chrono.data[0] = min
        slef.chrono.data[1] = sec
        return slef.chrono

# Conjunto de ejecuciones iniciales
def main():
    rospy.init_node('godclock')
    Instance = Template()
    Instance.godclock()
    rospy.spin()

# Ejecucion inicial
if __name__ =='__main__':
        main()
