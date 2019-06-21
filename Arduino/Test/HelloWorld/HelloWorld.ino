#include <ros.h>
//Importa la libreria de ROS
#include <std_msgs/String.h>
//Importa los mensajes de ROS del tipo String

ros::NodeHandle  nh;
//Crea el nodo para ROS

std_msgs::String str_msg;
//Establece el tipo de valor para el mensaje
ros::Publisher chatter("chatter", &str_msg);
//Inicia el publicador y crea el topico

char hello[13] = "hello world!";
//Guarda valores, ASCII también es un valor

void setup()
{
  nh.initNode();
  //Inicia el nodo
  nh.advertise(chatter);
  //'Promociona' el topico al que publica
}

void loop()
{
  str_msg.data = hello;
  //Crea el valor del Stirng y lo guarda en el mensaje
  chatter.publish( &str_msg );
  //Publica el mensaje
  nh.spinOnce();
  //Cuando llega (o sale) un mensaje, ROS lo pone en queue y
  //no lo hace salir hasta que este comando es invocado
  delay(1000);
}
