import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twende/model/token.dart';

class AppPref {
  static SharedPreferences? prefs;

  static const String theme = "theme";
  static const languagePrefs = "language";
  static const biometricTime = "biometric_time";
  static const biometric = "biometric";
  static const String user = "user";
  static const String stayConnected = "stay_connected";
  static const String mobilTokenKey = "mobile_token_key";

  static ValueNotifier<UserPerfsInfo> showUserPerf =
      ValueNotifier(UserPerfsInfo());

  static void setTheme(bool isDark) {
    prefs!.setBool(
      theme,
      isDark,
    );
  }

  static bool? get getTheme => prefs?.getBool(theme);

  static bool? get getBiometric => AppPref.prefs?.getBool(AppPref.biometric);

  static int get getShowBiometricTime =>
      AppPref.prefs?.getInt(AppPref.biometricTime) ?? 0;

  static void setBiometric(bool hasSetBiometric) {
    AppPref.prefs!.setBool(
      AppPref.biometric,
      hasSetBiometric,
    );
  }

  static void setShowBiometricTime(int time) {
    AppPref.prefs!.setInt(
      AppPref.biometricTime,
      time,
    );
  }

  static void setLanguagePrefs(String language) {
    AppPref.prefs!.setString(
      AppPref.languagePrefs,
      language,
    );
  }

  static String? get getLanguagePrefs =>
      AppPref.prefs?.getString(AppPref.languagePrefs);

  static UserPref getUserInfo() {
    var userInfo = AppPref.prefs?.getString(AppPref.mobilTokenKey) ?? '';
    if (userInfo.isEmpty) {
      return UserPref(
        token: Token(
          value: "",
        ),
      );
    } else {
      var json = jsonDecode(userInfo);
      return UserPref.fromJson(json);
    }
  }

  static void setUserInfo(UserPref userInfo) {
    AppPref.prefs!.setString(
      AppPref.mobilTokenKey,
      jsonEncode(
        userInfo.toJson(),
      ),
    );
  }
}

bool get getStayConnected =>
    AppPref.prefs?.getBool(AppPref.stayConnected) ?? false;
void setStayConnected(bool stay) {
  AppPref.prefs!.setBool(AppPref.stayConnected, stay);
}

class UserPref {
  Token? token;
  UserPerfsInfo? userPerfsInfo;

  UserPref({this.token, this.userPerfsInfo});

  UserPref.fromJson(Map<String, dynamic> json) {
    token = Token.fromJson(json['token']);
    userPerfsInfo = json['userPerfsInfo'] != null
        ? UserPerfsInfo.fromJson(json['userPerfsInfo'])
        : null;
  }

  toJson() => {
        "token": token,
        "userPerfsInfo": userPerfsInfo?.toJson(),
      };
}

class UserPerfsInfo {
  String? name;
  String? countryCode;
  String? number;
  String? address;
  String? email;
  String? avatar;

  UserPerfsInfo(
      {this.name, this.address, this.countryCode, this.number, this.email});

  UserPerfsInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    countryCode = json['country_code'];
    number = json['number'];
    address = json['address'];
    email = json['email'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['country_code'] = countryCode;
    data['number'] = number;
    data['address'] = address;
    data['email'] = email;
    data['avatar'] = avatar;
    return data;
  }
}
