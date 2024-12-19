import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twende/services/app_setting.dart';
import 'package:twende/services/shared_prefs.dart';
import 'package:twende/twende.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppPref.prefs = await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider<AppSetting>(
      create: (context) => AppSetting(),
      child: Consumer<AppSetting>(
        builder: (context, value, child) => const Twende(),
      ),
    ),
  );
}
