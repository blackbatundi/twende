import 'package:flutter/material.dart';
import 'package:twende/views/activite/activite.dart';
import 'package:twende/views/auth/login_page.dart';
import 'package:twende/views/auth/otp_page.dart';
import 'package:twende/views/home/home.dart';
import 'package:twende/views/livret/livret.dart';
import 'package:twende/views/membre/membre.dart';
import 'package:twende/views/situation_de_demenagement/situation_de_demenagement.dart';
import 'package:twende/views/start/splash_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginPage.routeName: (context) => const LoginPage(),
  OtpPage.routeName: (context) => const OtpPage(),
  App.routeName: (context) => const App(),
  LivretMenage.routeName: (context) => const LivretMenage(),
  Membre.routeName: (context) => const Membre(),
  Activite.routeName: (context) => const Activite(),
  SituationdeMenage.routeName: (context) => const SituationdeMenage(),
};
