import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:twende/services/app_setting.dart';
import 'package:twende/services/routers/routes.dart';
import 'package:twende/services/style.dart';
import 'package:twende/views/start/splash_screen.dart';

class Twende extends StatefulWidget {
  const Twende({super.key});

  @override
  State<Twende> createState() => _TwendeState();
}

class _TwendeState extends State<Twende> {
  AppStyle appStyle = AppStyle();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (mounted) {
      Provider.of<AppSetting>(context, listen: false).platFormthemeListner();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // darkTheme: appStyle.darkTheme(context),
      theme: appStyle.lightTheme(context),
      themeMode: Provider.of<AppSetting>(context).getThemeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const SplashScreen(),
      routes: routes,
    );
  }
}
