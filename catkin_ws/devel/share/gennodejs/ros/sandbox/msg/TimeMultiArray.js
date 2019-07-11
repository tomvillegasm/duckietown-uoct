// Auto-generated. Do not edit!

// (in-package sandbox.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class TimeMultiArray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.StoplightTime = null;
      this.minutes = null;
      this.seconds = null;
    }
    else {
      if (initObj.hasOwnProperty('StoplightTime')) {
        this.StoplightTime = initObj.StoplightTime
      }
      else {
        this.StoplightTime = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('minutes')) {
        this.minutes = initObj.minutes
      }
      else {
        this.minutes = [];
      }
      if (initObj.hasOwnProperty('seconds')) {
        this.seconds = initObj.seconds
      }
      else {
        this.seconds = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TimeMultiArray
    // Serialize message field [StoplightTime]
    bufferOffset = std_msgs.msg.Header.serialize(obj.StoplightTime, buffer, bufferOffset);
    // Serialize message field [minutes]
    bufferOffset = _arraySerializer.int16(obj.minutes, buffer, bufferOffset, null);
    // Serialize message field [seconds]
    bufferOffset = _arraySerializer.int16(obj.seconds, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TimeMultiArray
    let len;
    let data = new TimeMultiArray(null);
    // Deserialize message field [StoplightTime]
    data.StoplightTime = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [minutes]
    data.minutes = _arrayDeserializer.int16(buffer, bufferOffset, null)
    // Deserialize message field [seconds]
    data.seconds = _arrayDeserializer.int16(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.StoplightTime);
    length += 2 * object.minutes.length;
    length += 2 * object.seconds.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sandbox/TimeMultiArray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8f037166f662f8756df277bb1c73f274';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header StoplightTime
    int16[] minutes
    int16[] seconds
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TimeMultiArray(null);
    if (msg.StoplightTime !== undefined) {
      resolved.StoplightTime = std_msgs.msg.Header.Resolve(msg.StoplightTime)
    }
    else {
      resolved.StoplightTime = new std_msgs.msg.Header()
    }

    if (msg.minutes !== undefined) {
      resolved.minutes = msg.minutes;
    }
    else {
      resolved.minutes = []
    }

    if (msg.seconds !== undefined) {
      resolved.seconds = msg.seconds;
    }
    else {
      resolved.seconds = []
    }

    return resolved;
    }
};

module.exports = TimeMultiArray;
