#include <ros.h>
#include <std_msgs/Int16.h>

ros::NodeHandle  nh;

int on= 255;
int off= 0;
int rpl= 11;
int gpl= 10;
int bpl= 9;
int rpr= 6;
int gpr= 5;
int bpr= 3;

void led(int red, int green, int blue)
{
  analogWrite(rpl,red);
  analogWrite(gpl,red);
  analogWrite(bpl,red);
  analogWrite(rpr,red);
  analogWrite(gpr,red);
  analogWrite(bpr,red);
}

std_msgs::Int16 slave;
ros::Publisher pub("uoct/stoplight/slave", &slave);

// RBG == 012
void master( const std_msgs::Int16 &msg)
{
  if (msg.data == 0)
  {
    digitalWrite(LED_BUILTIN,HIGH);
    led(on,off,off);
    slave.data = 2;
    pub.publish(&slave);
  }
  if (msg.data == 1)
  {
    digitalWrite(LED_BUILTIN,LOW);
    led(off,on,off);
  }
  if (msg.data == 2)
  {
    digitalWrite(LED_BUILTIN,LOW);
    led(off,on,off);
    slave.data = 0;
    pub.publish(&slave);
  }
}

ros::Subscriber<std_msgs::Int16> sub("uoct/stoplight/master", &master);

void setup()
{
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(rpl, OUTPUT);
  pinMode(gpl, OUTPUT);
  pinMode(bpl, OUTPUT);
  pinMode(rpr, OUTPUT);
  pinMode(gpr, OUTPUT);
  pinMode(bpr, OUTPUT);
  nh.initNode();
  nh.subscribe(sub);
  nh.advertise(pub);
}

void loop()
{
  nh.spinOnce();
}
