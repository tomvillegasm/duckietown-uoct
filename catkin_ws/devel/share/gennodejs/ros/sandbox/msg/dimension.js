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

class dimension {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.label = null;
      this.street = null;
      this.cross = null;
    }
    else {
      if (initObj.hasOwnProperty('label')) {
        this.label = initObj.label
      }
      else {
        this.label = '';
      }
      if (initObj.hasOwnProperty('street')) {
        this.street = initObj.street
      }
      else {
        this.street = [];
      }
      if (initObj.hasOwnProperty('cross')) {
        this.cross = initObj.cross
      }
      else {
        this.cross = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type dimension
    // Serialize message field [label]
    bufferOffset = _serializer.string(obj.label, buffer, bufferOffset);
    // Serialize message field [street]
    bufferOffset = _arraySerializer.int16(obj.street, buffer, bufferOffset, null);
    // Serialize message field [cross]
    bufferOffset = _arraySerializer.int16(obj.cross, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type dimension
    let len;
    let data = new dimension(null);
    // Deserialize message field [label]
    data.label = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [street]
    data.street = _arrayDeserializer.int16(buffer, bufferOffset, null)
    // Deserialize message field [cross]
    data.cross = _arrayDeserializer.int16(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.label.length;
    length += 2 * object.street.length;
    length += 2 * object.cross.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sandbox/dimension';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c567be47ab17b0dffb7f0c899206810b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new dimension(null);
    if (msg.label !== undefined) {
      resolved.label = msg.label;
    }
    else {
      resolved.label = ''
    }

    if (msg.street !== undefined) {
      resolved.street = msg.street;
    }
    else {
      resolved.street = []
    }

    if (msg.cross !== undefined) {
      resolved.cross = msg.cross;
    }
    else {
      resolved.cross = []
    }

    return resolved;
    }
};

module.exports = dimension;
