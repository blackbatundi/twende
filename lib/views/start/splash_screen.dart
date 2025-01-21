import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twende/services/app_local.dart';
import 'package:twende/services/style.dart';
import 'package:twende/views/auth/login_page.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash_screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Locale applocal = Localizations.localeOf(context);
    AppLocal.locale = applocal.toString();
    //AppPref.prefs!.clear();

    super.didChangeDependencies();
  }

  void init() {
    Future.delayed(
      const Duration(
        milliseconds: 1500,
      ),
      () async {
        Navigator.pushReplacementNamed(context, LoginPage.routeName);

        // UserPref token = UserPref();
        // token = AppPref.getUserInfo();
        // if (token.token!.value!.isEmpty) {
        //   Navigator.pushNamed(context, LoginPage.routeName);
        //   return;
        // } else {
        //   Navigator.pushReplacementNamed(context, App.routeName);
        // }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).primaryColor,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: Theme.of(context).primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppStyle.PRIMERYCOLOR,
        body: SafeArea(
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppStyle.SPACING_3XL,
              ),
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).disabledColor.withOpacity(.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
