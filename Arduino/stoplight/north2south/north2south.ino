#include <ros.h>
#include <std_msgs/Int16MultiArray.h>

ros::NodeHandle  nh;

int rpA= 11;
int gpA= 10;
int bpA= 9;

int rpB= 6;
int gpB= 5;
int bpB= 3;

// RBG == 012
void led(const std_msgs::Int16MultiArray& msg)
{
    
  if (msg.data[0]==255)
  {
    digitalWrite(LED_BUILTIN,HIGH);
  }
  if (msg.data[0]==0)
  {
    digitalWrite(LED_BUILTIN,LOW);
  }
    
  analogWrite(rpA,msg.data[0]);
  analogWrite(gpA,msg.data[1]);
  analogWrite(bpA,msg.data[2]);

  analogWrite(rpB,msg.data[3]);
  analogWrite(gpB,msg.data[4]);
  analogWrite(bpB,msg.data[5]);
}

ros::Subscriber<std_msgs::Int16MultiArray> sub("stoplight/north2south", &led);

void setup()
{
  pinMode(LED_BUILTIN,OUTPUT);
  pinMode(rpA, OUTPUT);
  pinMode(gpA, OUTPUT);
  pinMode(bpA, OUTPUT);
  pinMode(rpB, OUTPUT);
  pinMode(gpB, OUTPUT);
  pinMode(bpB, OUTPUT);
  nh.initNode();
  nh.subscribe(sub);
}

void loop()
{
  nh.spinOnce();
}
