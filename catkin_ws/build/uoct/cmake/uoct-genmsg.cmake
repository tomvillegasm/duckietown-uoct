# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "uoct: 3 messages, 0 services")

set(MSG_I_FLAGS "-Iuoct:/home/tomvillegasm/duckietown-uoct/catkin_ws/src/uoct/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators

add_custom_target(uoct_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/tomvillegasm/duckietown-uoct/catkin_ws/src/uoct/msg/Clock.msg" NAME_WE)
add_custom_target(_uoct_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "uoct" "/home/tomvillegasm/duckietown-uoct/catkin_ws/src/uoct/msg/Clock.msg" "std_msgs/Header"
)

#
#  langs = 
#


