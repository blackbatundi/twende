import 'package:flutter/material.dart';
import 'package:twende/views/auth/login_page.dart';
import 'package:twende/views/auth/otp_page.dart';
import 'package:twende/views/home/home.dart';
import 'package:twende/views/start/splash_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginPage.routeName: (context) => const LoginPage(),
  OtpPage.routeName: (context) => const OtpPage(),
  App.routeName: (context) => const App(),
};
