#include <ros.h>
#include <std_msgs/Int16MultiArray.h>

ros::NodeHandle  nh;

int rpA= 6;
int gpA= 5;
int bpA= 3;

int rpB= 11;
int gpB= 10;
int bpB= 9;

// RBG == 012
void led(const std_msgs::Int16MultiArray& msg)
{

  if (msg.data[1]==255)
  {
    digitalWrite(LED_BUILTIN,HIGH);
  }
  if (msg.data[1]==0)
  {
    digitalWrite(LED_BUILTIN,LOW);
  }

  analogWrite(rpA,msg.data[0]);
  analogWrite(gpA,msg.data[1]);
  analogWrite(bpA,msg.data[2]);

  analogWrite(rpB,msg.data[0]);
  analogWrite(gpB,msg.data[1]);
  analogWrite(bpB,msg.data[2]);
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
