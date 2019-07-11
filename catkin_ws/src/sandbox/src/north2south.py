#!/usr/bin/env python

# Importa elementos ROS para que python sepa a donde dirigir los comandos
import rospy
# Importa desde el elemento mensaje el tipo de mensaje a intercambiar (texto, numero, nada)
from std_msgs.msg import Int16MultiArray, MultiArrayDimension, MultiArrayLayout

# Semaforos fuera de sincronizacion parten en color azul

# Almacena el color del semaforo calle y lo retorna como un arreglo
class StreetStoplight(object):
    def __init__(self):
        self.red = 0
        self.green = 0
        self.blue = 255

    def lights(self):
        return [self.red,self.green,self.blue]

# Almacena el color del semaforo cruce y lo retorna como arreglo
class CrossStoplight(object):
    def __init__(self):
        self.red = 0
        self.green = 0
        self.blue = 255

    def lights(self):
        return [self.red,self.green,self.blue]

# Almacena el tiempo de Godclock y lo retorna como arreglo
class GodclockInternal(object):
    def __init__(self):
        self.min = 0
        self.sec = 0

    def time(self):
        return [self.min,self.sec]

class Template(object):
    def __init__(self):
        super(Template, self).__init__()
        self.sub = rospy.Subscriber("uoct/godclock", Int16MultiArray, self.thirty_sec)
        self.pub = rospy.Publisher("stoplight/north2south", Int16MultiArray, queue_size=7)

        # Se crea la instancia de clases requeridas
        # self.lights = Int16MultiArray()
        self.street = StreetStoplight()
        self.cross = CrossStoplight()
        self.clock = GodclockInternal()
        # Establece el desface de semaforos
        self.gap = 7
        # self.lights.layout.data_offset = self.gap
        # Establece la dimension del layout del mensaje
        # self.lights.layout.dim = [[0,0,0],[0,0,0],[0,0]]
        # Empaqueta el color del semaforo dentro del mensaje
        # self.lights.layout.dim[0] = self.street.lights()
        # self.lights.layout.dim[1] = self.cross.lights()
        # self.lights.layout.dim[2] = self.clock.time()
        # Intensidad de los led
        self.on = 255
        # self.lights.layout.dim = [[0],[0],[0]]
        # self.lights.data = [0,0,0]
        # self.lights.layout.dim = [0,0]
        # self.lights.layout.dim[0].label = 'mip'
        # self.lights.layout.dim[0] = [3,4,5]
        # self.lights.layout.dim[0] = self.street.lights()
        # self.lights.layout.dim[1] = self.cross.lights()
        # self.lights.layout.dim[2] = self.clock.time()

    def thirty_sec(self,msg):

        arg = Int16MultiArray()
        # print arg
        thing = MultiArrayDimension()
        # print thing
        thing2 = MultiArrayDimension()
        print thing
        mipper = MultiArrayLayout()
        # print mipper
        thing.label="Mipper"
        thing.size=2
        thing.stride=[2.2,2]
        thing2.label="Snow"
        thing2.size=7
        thing2.stride=[7,7,7]
        # print thing
        mipper.dim.append(thing)
        mipper.dim.append(thing2)
        # mipper.layout.dim.append(mipper)
        # print mipper

        # print self.lights
        # print self.clock.time()
        # print self.cross.lights()
        # print self.street.lights()
        # print self.clock.time()
        # print '\n'
        #
        #
        # mipper = self.lights
        # # self.pub.publish(mipper)
        # # Tiempo de Godclock
        # self.clock.min = msg.data[0]
        # self.clock.sec = msg.data[1]
        # # self.pub.publish(self.lights)
        #
        # # Desface en cambio de luces
        # self.gap = 2
        # # Semaforo de 30 segundos
        # if self.clock.sec == 30:
        #     # Semaforo calle rojo
        #     self.street.red = self.on
        #     self.street.green = 0
        #     self.street.blue = 0
        #     # self.pub.publish(self.lights)
        #
        # if self.clock.sec == (30 + self.gap):
        #     # Semaforo cruce verde
        #     self.cross.red = 0
        #     self.cross.green = self.on
        #     self.cross.blue = 0
        #     # self.pub.publish(self.lights)
        #
        # if self.clock.sec == 0:
        #     # Semaforo cruce rojo
        #     self.cross.red = self.on
        #     self.cross.green = 0
        #     self.cross.blue = 0
        #     # self.pub.publish(self.lights)
        #
        # if self.clock.sec == (0 + self.gap):
        #     # Semaforo calle verde
        #     self.street.red = 0
        #     self.street.green = self.on
        #     self.street.blue = 0
        #     # self.pub.publish(self.lights)

def main():
    rospy.init_node('north2south')
    Instance = Template()
    rospy.spin()

if __name__ =='__main__':
    main()
