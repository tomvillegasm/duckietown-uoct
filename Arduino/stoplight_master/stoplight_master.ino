#include <ros.h>
#include <std_msgs/Int16.h>

ros::NodeHandle  nh;

int on= 125;
int off= 0;

int rpA= 11;
int gpA= 10;
int bpA= 9;

int rpB= 6;
int gpB= 5;
int bpB= 3;

void ledA(int red, int green, int blue)
{
  analogWrite(rpA,red);
  analogWrite(gpA,green);
  analogWrite(bpA,blue);
}
void ledB(int red, int green, int blue)
{
  analogWrite(rpB,red);
  analogWrite(gpB,green);
  analogWrite(bpB,blue);
}

// RBG == 012
void core(const std_msgs::Int16 &msg)
{
  if (msg.data == 0)
  {
    digitalWrite(LED_BUILTIN,HIGH);
    ledA(on,off,off);
    ledB(off,on,off);
  }
  if (msg.data == 1)
  {
    digitalWrite(LED_BUILTIN,LOW);
    ledA(off,on,off);
    ledB(on,off,off);
  }
  if (msg.data == 2)
  {
    ledA(off,off,on);
    ledB(off,off,on);
  }
}

ros::Subscriber<std_msgs::Int16> sub("/timing/uoct/stoplight/master", &core);

void setup()
{
  pinMode(LED_BUILTIN, OUTPUT);
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
