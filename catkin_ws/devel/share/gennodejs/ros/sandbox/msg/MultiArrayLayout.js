// Auto-generated. Do not edit!

// (in-package sandbox.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let MultiArraySubDimension = require('./MultiArraySubDimension.js');

//-----------------------------------------------------------

class MultiArrayLayout {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.stoplights = null;
      this.deface = null;
    }
    else {
      if (initObj.hasOwnProperty('stoplights')) {
        this.stoplights = initObj.stoplights
      }
      else {
        this.stoplights = [];
      }
      if (initObj.hasOwnProperty('deface')) {
        this.deface = initObj.deface
      }
      else {
        this.deface = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MultiArrayLayout
    // Serialize message field [stoplights]
    // Serialize the length for message field [stoplights]
    bufferOffset = _serializer.uint32(obj.stoplights.length, buffer, bufferOffset);
    obj.stoplights.forEach((val) => {
      bufferOffset = MultiArraySubDimension.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [deface]
    bufferOffset = _serializer.int16(obj.deface, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MultiArrayLayout
    let len;
    let data = new MultiArrayLayout(null);
    // Deserialize message field [stoplights]
    // Deserialize array length for message field [stoplights]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.stoplights = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.stoplights[i] = MultiArraySubDimension.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [deface]
    data.deface = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.stoplights.forEach((val) => {
      length += MultiArraySubDimension.getMessageSize(val);
    });
    return length + 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sandbox/MultiArrayLayout';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c71496406d4b1a871cb3ce7d7daa62da';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    sandbox/MultiArraySubDimension[] stoplights # colection of stoplights to send message
    int16 deface
    
    ================================================================================
    MSG: sandbox/MultiArraySubDimension
    string label # cross, street, blink warning
    int16[] colors # [red,gree,blue,custom]
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MultiArrayLayout(null);
    if (msg.stoplights !== undefined) {
      resolved.stoplights = new Array(msg.stoplights.length);
      for (let i = 0; i < resolved.stoplights.length; ++i) {
        resolved.stoplights[i] = MultiArraySubDimension.Resolve(msg.stoplights[i]);
      }
    }
    else {
      resolved.stoplights = []
    }

    if (msg.deface !== undefined) {
      resolved.deface = msg.deface;
    }
    else {
      resolved.deface = 0
    }

    return resolved;
    }
};

module.exports = MultiArrayLayout;
