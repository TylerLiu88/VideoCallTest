import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Message {
  /*
  Things associated with a text message
   */
  String senderId;
  String receiverId;
  String type;
  String message;
  FieldValue timeStamp;
  String photoUrl;

  //Regular Constructor
  Message(
      {this.senderId,
      this.receiverId,
      this.type,
      this.message,
      this.timeStamp});

  //Will only be called if user wants to send a photo
  Message.imageMessage(
      {this.senderId,
      this.receiverId,
      this.type,
      this.message,
      this.timeStamp,
      this.photoUrl});

  //Convert message data into a map
  Map toMap() {
    var map = Map<String, dynamic>();
    map['senderId'] = this.senderId;
    map['receiverId'] = this.receiverId;
    map['type'] = this.type;
    map['message'] = this.message;
    map['timestamp'] = this.timeStamp;

    return map;
  }

  //Return message from a map variable
  Message fromMap(Map<String, dynamic> map) {
    //Is this recursive?
    Message _message = Message();
    _message.senderId = map['senderId'];
    _message.receiverId = map['receiverId'];
    _message.type = map['type'];
    _message.message = map['message'];
    _message.timeStamp = map['timeStamp'];
    return _message;
  }
}
