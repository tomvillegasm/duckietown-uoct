// Auto-generated. Do not edit!

// (in-package sandbox.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Stoplight = require('./Stoplight.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class StoplightMultiArray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.StoplightMultiArray = null;
      this.traffic_lights = null;
      this.deface = null;
      this.clock = null;
    }
    else {
      if (initObj.hasOwnProperty('StoplightMultiArray')) {
        this.StoplightMultiArray = initObj.StoplightMultiArray
      }
      else {
        this.StoplightMultiArray = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('traffic_lights')) {
        this.traffic_lights = initObj.traffic_lights
      }
      else {
        this.traffic_lights = [];
      }
      if (initObj.hasOwnProperty('deface')) {
        this.deface = initObj.deface
      }
      else {
        this.deface = 0;
      }
      if (initObj.hasOwnProperty('clock')) {
        this.clock = initObj.clock
      }
      else {
        this.clock = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type StoplightMultiArray
    // Serialize message field [StoplightMultiArray]
    bufferOffset = std_msgs.msg.Header.serialize(obj.StoplightMultiArray, buffer, bufferOffset);
    // Serialize message field [traffic_lights]
    // Serialize the length for message field [traffic_lights]
    bufferOffset = _serializer.uint32(obj.traffic_lights.length, buffer, bufferOffset);
    obj.traffic_lights.forEach((val) => {
      bufferOffset = Stoplight.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [deface]
    bufferOffset = _serializer.int16(obj.deface, buffer, bufferOffset);
    // Serialize message field [clock]
    bufferOffset = _arraySerializer.int16(obj.clock, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type StoplightMultiArray
    let len;
    let data = new StoplightMultiArray(null);
    // Deserialize message field [StoplightMultiArray]
    data.StoplightMultiArray = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [traffic_lights]
    // Deserialize array length for message field [traffic_lights]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.traffic_lights = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.traffic_lights[i] = Stoplight.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [deface]
    data.deface = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [clock]
    data.clock = _arrayDeserializer.int16(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.StoplightMultiArray);
    object.traffic_lights.forEach((val) => {
      length += Stoplight.getMessageSize(val);
    });
    length += 2 * object.clock.length;
    return length + 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sandbox/StoplightMultiArray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '36040492c6f40acc8475256baa3fc1e7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header StoplightMultiArray
    sandbox/Stoplight[] traffic_lights
    int16 deface
    int16[] clock# syncronized clock for all stoplights
    
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
    
    ================================================================================
    MSG: sandbox/Stoplight
    Header Stoplight
    string type # cross, street, blink warning
    string direction # norht2south, east2west, up2down
    int16[] colors # [red,gree,blue,custom]
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new StoplightMultiArray(null);
    if (msg.StoplightMultiArray !== undefined) {
      resolved.StoplightMultiArray = std_msgs.msg.Header.Resolve(msg.StoplightMultiArray)
    }
    else {
      resolved.StoplightMultiArray = new std_msgs.msg.Header()
    }

    if (msg.traffic_lights !== undefined) {
      resolved.traffic_lights = new Array(msg.traffic_lights.length);
      for (let i = 0; i < resolved.traffic_lights.length; ++i) {
        resolved.traffic_lights[i] = Stoplight.Resolve(msg.traffic_lights[i]);
      }
    }
    else {
      resolved.traffic_lights = []
    }

    if (msg.deface !== undefined) {
      resolved.deface = msg.deface;
    }
    else {
      resolved.deface = 0
    }

    if (msg.clock !== undefined) {
      resolved.clock = msg.clock;
    }
    else {
      resolved.clock = []
    }

    return resolved;
    }
};

module.exports = StoplightMultiArray;
