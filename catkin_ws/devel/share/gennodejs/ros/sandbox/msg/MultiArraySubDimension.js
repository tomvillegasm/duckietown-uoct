// Auto-generated. Do not edit!

// (in-package sandbox.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class MultiArraySubDimension {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.label = null;
      this.colors = null;
    }
    else {
      if (initObj.hasOwnProperty('label')) {
        this.label = initObj.label
      }
      else {
        this.label = '';
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
    // Serializes a message object of type MultiArraySubDimension
    // Serialize message field [label]
    bufferOffset = _serializer.string(obj.label, buffer, bufferOffset);
    // Serialize message field [colors]
    bufferOffset = _arraySerializer.int16(obj.colors, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MultiArraySubDimension
    let len;
    let data = new MultiArraySubDimension(null);
    // Deserialize message field [label]
    data.label = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [colors]
    data.colors = _arrayDeserializer.int16(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.label.length;
    length += 2 * object.colors.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sandbox/MultiArraySubDimension';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6def1837502a9057eabbae76543b5b87';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string label # cross, street, blink warning
    int16[] colors # [red,gree,blue,custom]
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MultiArraySubDimension(null);
    if (msg.label !== undefined) {
      resolved.label = msg.label;
    }
    else {
      resolved.label = ''
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

module.exports = MultiArraySubDimension;
