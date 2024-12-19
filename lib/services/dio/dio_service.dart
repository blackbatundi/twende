import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:twende/model/token.dart';
import 'package:twende/services/app_local.dart';
import 'package:twende/services/dio/dio_helper.dart';
import 'package:twende/services/shared_prefs.dart';

Future<Response> httpGet(
    {String? endPoint, Map<String, dynamic>? parameters}) async {
  parameters == null
      ? parameters = {
          "lang": AppLocal.locale,
        }
      : parameters['lang'] = AppLocal.locale;

  var response = await DioApi().dio.get(
        endPoint!,
        queryParameters: parameters,
        options: Options(
          headers: {
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );

  return response;
}

Future<Response> httpGetWithToken({
  String? endPoint,
  Map<String, dynamic>? parameters,
  Token? tokenValue,
  Map<String, dynamic>? data,
}) async {
  parameters == null
      ? parameters = {
          "lang": AppLocal.locale,
        }
      : parameters['lang'] = AppLocal.locale;

  Token token = tokenValue ?? AppPref.getUserInfo().token!;
  debugPrint(parameters.toString());
  debugPrint(endPoint.toString());

  var response = await DioApi().dio.get(
        endPoint!,
        data: data,
        queryParameters: parameters,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${token.value}',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );

  return response;
}

/// ----------------------------------------------------------
/// Http "POST" request
/// ----------------------------------------------------------
Future<Response> httpPost(
    {String? endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? parameters}) async {
  parameters == null
      ? parameters = {"lang": AppLocal.locale}
      : parameters['lang'] = AppLocal.locale;
  debugPrint(data.toString());
  debugPrint(endPoint);
  return await DioApi().dio.post(
        endPoint!,
        queryParameters: parameters,
        options: Options(
          headers: {
            "X-Requested-With": "XMLHttpRequest",
            "Content-Type": "application/json",
          },
        ),
        data: data,
      );
}

Future<Response> httpPostWithToken({
  String? endPoint,
  var data,
  Map<String, dynamic>? parameters,
  Token? tokenValue,
}) async {
  parameters == null
      ? parameters = {
          "lang": AppLocal.locale,
        }
      : parameters['lang'] = AppLocal.locale;
  Token token = tokenValue ?? AppPref.getUserInfo().token!;
  debugPrint(token.value);
  debugPrint(endPoint);
  debugPrint(data.toString());
  return await DioApi().dio.post(
        endPoint!,
        data: data,
        queryParameters: parameters,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${token.value}',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
}

Future<Response> httpDeleteWithToken(
    {String? endPoint,
    var data,
    Map<String, dynamic>? parameters,
    Token? tokenValue}) async {
  parameters == null
      ? parameters = {
          "lang": AppLocal.locale,
        }
      : parameters['lang'] = AppLocal.locale;
  Token token = tokenValue ?? AppPref.getUserInfo().token!;
  debugPrint(token.value);
  debugPrint(endPoint);
  debugPrint(data.toString());
  return await DioApi().dio.delete(
        endPoint!,
        data: data,
        queryParameters: parameters,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${token.value}',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
}

Future<Response> httpPut({String? endPoint, var data}) async {
  return await DioApi().dio.put(
        endPoint!,
        data: data,
        options: Options(
          headers: {
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
}

Future<Response> httpPutWithToken({
  String? endPoint,
  var data,
  Map<String, dynamic>? parameters,
  Token? tokenValue,
}) async {
  parameters == null
      ? parameters = {
          "lang": AppLocal.locale,
        }
      : parameters['lang'] = AppLocal.locale;
  debugPrint(endPoint);
  Token token = tokenValue ?? AppPref.getUserInfo().token!;

  return await DioApi().dio.put(
        endPoint!,
        data: data,
        queryParameters: parameters,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${token.value}',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ),
      );
}
