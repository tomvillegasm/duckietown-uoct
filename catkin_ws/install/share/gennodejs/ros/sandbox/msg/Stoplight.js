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

class Stoplight {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Stoplight = null;
      this.type = null;
      this.direction = null;
      this.colors = null;
    }
    else {
      if (initObj.hasOwnProperty('Stoplight')) {
        this.Stoplight = initObj.Stoplight
      }
      else {
        this.Stoplight = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = '';
      }
      if (initObj.hasOwnProperty('direction')) {
        this.direction = initObj.direction
      }
      else {
        this.direction = '';
      }
      if (initObj.hasOwnProperty('colors')) {
        this.colors = initObj.colors
      }
      else {
        this.colors = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Stoplight
    // Serialize message field [Stoplight]
    bufferOffset = std_msgs.msg.Header.serialize(obj.Stoplight, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = _serializer.string(obj.type, buffer, bufferOffset);
    // Serialize message field [direction]
    bufferOffset = _serializer.string(obj.direction, buffer, bufferOffset);
    // Serialize message field [colors]
    bufferOffset = _arraySerializer.int16(obj.colors, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Stoplight
    let len;
    let data = new Stoplight(null);
    // Deserialize message field [Stoplight]
    data.Stoplight = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [direction]
    data.direction = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [colors]
    data.colors = _arrayDeserializer.int16(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.Stoplight);
    length += object.type.length;
    length += object.direction.length;
    length += 2 * object.colors.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sandbox/Stoplight';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6654bda664e47f8222314d4f89a55a15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header Stoplight
    string type # cross, street, blink warning
    string direction # norht2south, east2west, up2down
    int16[] colors # [red,gree,blue,custom]
    
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
    const resolved = new Stoplight(null);
    if (msg.Stoplight !== undefined) {
      resolved.Stoplight = std_msgs.msg.Header.Resolve(msg.Stoplight)
    }
    else {
      resolved.Stoplight = new std_msgs.msg.Header()
    }

    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = ''
    }

    if (msg.direction !== undefined) {
      resolved.direction = msg.direction;
    }
    else {
      resolved.direction = ''
    }

    if (msg.colors !== undefined) {
      resolved.colors = msg.colors;
    }
    else {
      resolved.colors = []
    }

    return resolved;
    }
};

module.exports = Stoplight;
