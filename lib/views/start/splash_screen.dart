import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:twende/services/app_local.dart';
import 'package:twende/services/extentions.dart';
import 'package:twende/services/style.dart';
import 'package:twende/views/auth/otp_page.dart';

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
        Navigator.pushReplacementNamed(context, OtpPage.routeName);

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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppStyle.SPACING_LG,
            vertical: AppStyle.SPACING_SM,
          ),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 180,
                        height: 180,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      10.heightBox,
                      Text(
                        AppLocalizations.of(context)!.tujikingeWord,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              15.heightBox,
              Text(
                AppLocalizations.of(context)!.upperzSolgan,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
