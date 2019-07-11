// Generated by gencpp from file sandbox/dimension.msg
// DO NOT EDIT!


#ifndef SANDBOX_MESSAGE_DIMENSION_H
#define SANDBOX_MESSAGE_DIMENSION_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace sandbox
{
template <class ContainerAllocator>
struct dimension_
{
  typedef dimension_<ContainerAllocator> Type;

  dimension_()
    : label()
    , street()
    , cross()  {
    }
  dimension_(const ContainerAllocator& _alloc)
    : label(_alloc)
    , street(_alloc)
    , cross(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _label_type;
  _label_type label;

   typedef std::vector<int16_t, typename ContainerAllocator::template rebind<int16_t>::other >  _street_type;
  _street_type street;

   typedef std::vector<int16_t, typename ContainerAllocator::template rebind<int16_t>::other >  _cross_type;
  _cross_type cross;





  typedef boost::shared_ptr< ::sandbox::dimension_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sandbox::dimension_<ContainerAllocator> const> ConstPtr;

}; // struct dimension_

typedef ::sandbox::dimension_<std::allocator<void> > dimension;

typedef boost::shared_ptr< ::sandbox::dimension > dimensionPtr;
typedef boost::shared_ptr< ::sandbox::dimension const> dimensionConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sandbox::dimension_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sandbox::dimension_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace sandbox

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'sandbox': ['/home/tomvillegasm/duckietown-uoct/catkin_ws/src/sandbox/msg'], 'std_msgs': ['/opt/ros/melodic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::sandbox::dimension_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sandbox::dimension_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sandbox::dimension_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sandbox::dimension_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sandbox::dimension_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sandbox::dimension_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sandbox::dimension_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c567be47ab17b0dffb7f0c899206810b";
  }

  static const char* value(const ::sandbox::dimension_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc567be47ab17b0dfULL;
  static const uint64_t static_value2 = 0xfb7f0c899206810bULL;
};

template<class ContainerAllocator>
struct DataType< ::sandbox::dimension_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sandbox/dimension";
  }

  static const char* value(const ::sandbox::dimension_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sandbox::dimension_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string label # Name or id of stoplight station (Arduino)\n"
"int16[] street # Colors of RGB\n"
"int16[] cross # Colors of RGB\n"
;
  }

  static const char* value(const ::sandbox::dimension_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sandbox::dimension_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.label);
      stream.next(m.street);
      stream.next(m.cross);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct dimension_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sandbox::dimension_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sandbox::dimension_<ContainerAllocator>& v)
  {
    s << indent << "label: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.label);
    s << indent << "street[]" << std::endl;
    for (size_t i = 0; i < v.street.size(); ++i)
    {
      s << indent << "  street[" << i << "]: ";
      Printer<int16_t>::stream(s, indent + "  ", v.street[i]);
    }
    s << indent << "cross[]" << std::endl;
    for (size_t i = 0; i < v.cross.size(); ++i)
    {
      s << indent << "  cross[" << i << "]: ";
      Printer<int16_t>::stream(s, indent + "  ", v.cross[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // SANDBOX_MESSAGE_DIMENSION_H
