import 'package:flutter/material.dart' show immutable;

abstract class AppEvent {}

@immutable
class SendPassWord implements AppEvent {
  final Map<String, dynamic> data;
  const SendPassWord({required this.data});
}

@immutable
class LoginEvent implements AppEvent {
  final String? username;
  final String? passWord;

  const LoginEvent({required this.username, required this.passWord});
}
