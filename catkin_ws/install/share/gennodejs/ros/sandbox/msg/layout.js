// Auto-generated. Do not edit!

// (in-package sandbox.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let dimension = require('./dimension.js');

//-----------------------------------------------------------

class layout {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.dim = null;
      this.clock = null;
    }
    else {
      if (initObj.hasOwnProperty('dim')) {
        this.dim = initObj.dim
      }
      else {
        this.dim = [];
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
    // Serializes a message object of type layout
    // Serialize message field [dim]
    // Serialize the length for message field [dim]
    bufferOffset = _serializer.uint32(obj.dim.length, buffer, bufferOffset);
    obj.dim.forEach((val) => {
      bufferOffset = dimension.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [clock]
    bufferOffset = _arraySerializer.int16(obj.clock, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type layout
    let len;
    let data = new layout(null);
    // Deserialize message field [dim]
    // Deserialize array length for message field [dim]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.dim = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.dim[i] = dimension.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [clock]
    data.clock = _arrayDeserializer.int16(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.dim.forEach((val) => {
      length += dimension.getMessageSize(val);
    });
    length += 2 * object.clock.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sandbox/layout';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f6424ad02d7a0d576d10eac3878f9649';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    sandbox/dimension[] dim
    int16[] clock
    
    ================================================================================
    MSG: sandbox/dimension
    string label # Name or id of stoplight station (Arduino)
    int16[] street # Colors of RGB
    int16[] cross # Colors of RGB
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new layout(null);
    if (msg.dim !== undefined) {
      resolved.dim = new Array(msg.dim.length);
      for (let i = 0; i < resolved.dim.length; ++i) {
        resolved.dim[i] = dimension.Resolve(msg.dim[i]);
      }
    }
    else {
      resolved.dim = []
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

module.exports = layout;
