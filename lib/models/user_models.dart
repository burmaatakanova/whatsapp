// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userName;
  final String id;
  final String email;
  final String parol;
  final Timestamp timestamp;

  UserModel(
      {required this.userName,
      required this.id,
      required this.email,
      required this.parol,
      required this.timestamp});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'id': id,
      'email': email,
      'parol': parol,
      'timestamp': timestamp,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['userName'] as String,
      id: map['id'] as String,
      email: map['email'] as String,
      parol: map['parol'] as String,
      timestamp: map['timestamp'] as Timestamp,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
