```mermaid
graph LR
A[PC]--USB-->B[Arduino]
```
* Para conectar ROS con Arduino se necesita usar la librería **rosserial_arduino**.

### Entendiendo _rosserial_
[Introducción a rosserial_arduino](https://atadiat.com/en/e-rosserial-arduino-introduction/)
* _Rosserial-Server_: El computador corriendo ROS (Subscriptor)
* _Rosserial-Client_: El Arduino leyendo sensores y publicando al servidor
* _Rosserial-Server_: Nodo publicador

### Enlaces Relacionados

[Arduino IDE Setup](http://wiki.ros.org/rosserial_arduino/Tutorials/Arduino%20IDE%20Setup)
[]


### Ejemplo Blinking Led con ROS
```
#include <ros.h>
#include <std_msgs/Empty.h>
ros::NodeHandle  nh;
void  messageCb(  const  std_msgs::Empty&  toggle_msg){
digitalWrite(13,  HIGH-digitalRead(13));
}
ros::Subscriber<std_msgs::Empty>  sub(“toggle  _led”,  &messageCb  );
void  setup()
{
pinMode(13,  OUTPUT);
nh.initNode();
nh.subscribe(sub);
}
void  loop()
{
nh.spinOnce();
delay(1);
}
```

| A | B |
| - | - |
| C | D |
