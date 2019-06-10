#include <ros.h>
#include <std_msgs/THE_TYPE_OF_THE_MESSAGE_YOU_SUBSCRIBER>

//create the ros node nh. The node will be used to publish to Arduino
ros::NodeHandle nh;


void messageCb(const std_msgs::MESSAGE_TYPE& msg)
{
  do_domething with msg.data;
}

ros::Subscriber<std_msgs::MESSAGE_TYPE> sub("THE_TOPIC_THAT_SUBSCRIBER", &messageCb);

void setup()
{
  nh.initNode();
  nh.subscribe(sub);
}

void loop()
{
  nh.spinOnce();
  delay(10);
}
