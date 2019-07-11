// Auto-generated. Do not edit!

// (in-package sandbox.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let layout = require('./layout.js');

//-----------------------------------------------------------

class array {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.layout = null;
      this.data = null;
    }
    else {
      if (initObj.hasOwnProperty('layout')) {
        this.layout = initObj.layout
      }
      else {
        this.layout = new layout();
      }
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type array
    // Serialize message field [layout]
    bufferOffset = layout.serialize(obj.layout, buffer, bufferOffset);
    // Serialize message field [data]
    bufferOffset = _arraySerializer.int16(obj.data, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type array
    let len;
    let data = new array(null);
    // Deserialize message field [layout]
    data.layout = layout.deserialize(buffer, bufferOffset);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.int16(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += layout.getMessageSize(object.layout);
    length += 2 * object.data.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sandbox/array';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '91faa4ba0e0b5a49fa10b31bb254bdd0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    sandbox/layout layout
    int16[] data # For aditional data realted
    
    ================================================================================
    MSG: sandbox/layout
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
    const resolved = new array(null);
    if (msg.layout !== undefined) {
      resolved.layout = layout.Resolve(msg.layout)
    }
    else {
      resolved.layout = new layout()
    }

    if (msg.data !== undefined) {
      resolved.data = msg.data;
    }
    else {
      resolved.data = []
    }

    return resolved;
    }
};

module.exports = array;
