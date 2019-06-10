#!/usr/bin/env python

from std_msgs.msg import Int32, Float32, String
from basics.msg import TimerAction, TimerGoal, TimeResult
from time import sleep

pin13_state = 1
class Template(object):
	def __init__(self, args):
		super(Template, self).__init__()
		self.args = args
		self.pub = rospy.Publisher("/duckietown-uoct/stoplight/blink",stoplight-blink, queue_size=10)
		self.sub = rospy.Subscriber("/duckietown-uoct/stoplight/state", stoplight-state, self.callback)

	def callback(self,msg):
    	global pin13_state
		speed = msg.axes[1]*inv
		turn = msg.axes[0]*1.2
		self.twist.v = speed*cambios
		self.twist.omega = turn*(-8)

		if msg.buttons[0] == 1:
			self.twist.v = 0
			self.twist.omega = 0
			self.pub.publish(self.twist)
		else:
			self.pub.publish(self.twist)
                if msg.buttons[4]==1 and cambios>0.4:
                        cambios=cambios-0.1
                if msg.buttons[5]==1 and cambios<1.1:
                        cambios=cambios+0.1
                if msg.buttons[1]:
                        inv=-inv
                if msg.buttons[2]==1:
                        cambios=1
	#	if msg.axes[1] == 1*(-1)
	#		rosphy.loginfo("retroceder")


	#def publicar(self):

	#def callback(self,msg):


def main():
	rospy.init_node('stoplight-blink') #creacion y registro del nodo
	obj = Template('args') # Crea un objeto del tipo Template, cuya definicion se encuentra arriba
	rospy.spin()

	#objeto.publicar() #llama al metodo publicar del objeto obj de tipo Template

	#rospy.spin() #funcion de ROS que evita que el programa termine -  se debe usar en  Subscribers


if __name__ =='__main__':
	main()
