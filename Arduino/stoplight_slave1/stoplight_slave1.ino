#include <ros.h>
//Importa la libreria ROS
#include <std_msgs/Empty.h>
//Establece tipo de datos a intercambiar (nada)

ros::NodeHandle  nh;
//Crea un nodo para ROS

void messageCb( const std_msgs::Empty &toggle_msg)
{
  digitalWrite(LED_BUILTIN, HIGH-digitalRead(LED_BUILTIN));
  //La instruccion que el hardware realizara
}

ros::Subscriber<std_msgs::Empty> sub("duckietown-uoct/stoplight/slave1", &messageCb );
//Establece el topico al que se subscribira y el tipo de datos a intercambiar (nada)
ros::Publisher chatter("duckietown-uoct/stoplight/slave1", &str_msg);
//Establece el topico al que publicara y el tipo de datos a intercambiar (nada)


void setup()
{
  pinMode(LED_BUILTIN, OUTPUT);
  //El pin13 es configurado como una salida
  nh.initNode();
  //Ejecuta el nodo
  nh.subscribe(sub);
  //Se subscribe al topico
  nh.advertise(duckietown-uoct/stoplight/slave1);
}

void loop()
{
  nh.spinOnce();
  //Mantiene el nodo activo y actualiza su estado
  chatter.publish( &str_msg );
  nh.spinOnce();
  delay(1);
}
