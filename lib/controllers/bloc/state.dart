import 'package:flutter/foundation.dart' show immutable;
import 'package:twende/services/dio/interceptors.dart';

abstract class AppState {}

@immutable
class SUCCESS implements AppState {
  final dynamic value;

  const SUCCESS({this.value});
}

@immutable
class ERROR implements AppState {
  final ErrorData? dueTo;
  const ERROR({this.dueTo});
}

@immutable
class LOADING implements AppState {
  final String? message;

  const LOADING({this.message});
}

@immutable
class INITIALSTATE implements AppState {}
