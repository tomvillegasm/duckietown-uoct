#!/usr/bin/env python

# Importa elementos ROS para que python sepa a donde dirigir los comandos
import rospy
# Importa desde el elemento mensaje el tipo de mensaje a intercambiar (texto, numero, nada)
from std_msgs.msg import Empty, String, Int32, Int16MultiArray
# Esto es para detener el codigo en cantidad de segundos
from time import sleep

class Template(object):
    def __init__(self):
        super(Template, self).__init__()
        self.sub = rospy.Subscriber("uoct/godclock", Int16MultiArray, self.thirty_sec)
        # self.pub = rospy.Subscriber("uoct/stoplight/godclock", Int16MultiArray, slef.sixty_sec)
        self.pub = rospy.Publisher("stoplight/east2west", Int16MultiArray, queue_size=7)
        self.lights = Int16MultiArray()
        # [R,G,B,x,x,x,y,y] semaforo calle, [x,x,x,R,G,B,y,y] semaforo patonal y [x,x,x,y,y,y,min,sec] godclock
        self.lights.data = [0,0,0,0,0,0,0,0]
        # La intensidad con la que encedera el led
        self.on_intensity = 255

    def thirty_sec(self,msg):
        # Hora actual de Godclock
        god_min = msg.data[0]
        god_sec = msg.data[1]
        # Para fines de debugging
        # [x,x,x,y,y,y,min,sec]
        self.lights.data[6] = god_min
        self.lights.data[7] = god_sec
        self.pub.publish(self.lights)
        # Semaforo de 30 segundos
        if god_sec == 30:
            # Semaforo rojo patones
            # [x,x,x,R,g,b,y,y]
            self.lights.data[3] = self.on_intensity
            self.lights.data[4] = 0
            self.lights.data[5] = 0
            self.pub.publish(self.lights)
        if god_sec == 32:
            # Semaforo verde duckiebot
            # [r,G,b,x,x,x,y,y]
            self.lights.data[0] = 0
            self.lights.data[1] = self.on_intensity
            self.lights.data[2] = 0
            self.pub.publish(self.lights)
        if god_sec == 0:
            # Semaforo rojo duckiebot
            # [R,g,b,x,x,x,y,y]
            self.lights.data[0] = self.on_intensity
            self.lights.data[1] = 0
            self.lights.data[2] = 0
            self.pub.publish(self.lights)
        if god_sec == 2:
            # Semaforo verde patones
            # [x,x,x,r,G,b,y,y]
            self.lights.data[3] = 0
            self.lights.data[4] = self.on_intensity
            self.lights.data[5] = 0
            self.pub.publish(self.lights)


def main():
    rospy.init_node('east2west')
    Instance = Template()
    # Por defecto, semaforo fuera de sincronia esta azul
    Instance.lights.data[2] = 255
    Instance.lights.data[5] = 255
    # Esto solo ocurre una vez
    Instance.pub.publish(Instance.lights)
    print 'Spotlights at East-West on sync'
    rospy.spin()

if __name__ =='__main__':
    main()
