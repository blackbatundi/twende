import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax/iconsax.dart';
import 'package:twende/controllers/auth/auth_controller.dart';
import 'package:twende/controllers/bloc/bloc.dart';
import 'package:twende/controllers/bloc/event.dart';
import 'package:twende/controllers/bloc/state.dart';
import 'package:twende/services/extentions.dart';
import 'package:twende/services/shared_prefs.dart';
import 'package:twende/services/style.dart';
import 'package:twende/utils/app_indicator.dart';
import 'package:twende/utils/button.dart';
import 'package:twende/utils/widegt.dart';
import 'package:twende/views/home/home.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/loginPage";
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  String? email;
  ValueNotifier<bool> stayConnected = ValueNotifier(false);
  AuthController authController = AuthController();

  late AppBloc bloc;

  @override
  void initState() {
    bloc = AppBloc();

    super.initState();
  }

  _submit({
    TextEditingController? controller,
  }) {
    bloc.add(LoginEvent(
      passWord: controller!.text.trim(),
      username: email,
    ));
  }

  @override
  Widget build(BuildContext context) {
    // email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppStyle.SPACING_LG,
            vertical: AppStyle.SPACING_SM,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(child: SizedBox.shrink()),
                  InkWell(
                    onTap: () {
                      // customershowDialog(
                      //   context,
                      //   child: const Language(),
                      // );
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).disabledColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.translate,
                            size: 20,
                          ),
                          5.widthBox,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: BlocListener<AppBloc, AppState>(
                    bloc: bloc,
                    listener: (context, state) {
                      if (state is SUCCESS) {
                        Navigator.pushReplacementNamed(
                          context,
                          App.routeName,
                        );
                      } else if (state is ERROR) {
                        InfoBar(context).error(
                          message: state.dueTo?.message,
                          title: AppLocalizations.of(context)!.errorWord,
                        );
                      }
                    },
                    child: BlocBuilder<AppBloc, AppState>(
                      bloc: bloc,
                      builder: (context, state) {
                        return Column(
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
                            Text(
                              AppLocalizations.of(context)!.loginWord,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.color,
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                height: 1.5,
                              ),
                            ),
                            AppStyle.SPACING_XL.heightBox,
                            PassWordTextField(
                              labelText:
                                  AppLocalizations.of(context)!.passwordWord,
                              hintText: AppLocalizations.of(context)!
                                  .entreryourpassWord,
                              controller: authController.passWord,
                              icon: Iconsax.lock,
                            ),
                            AppStyle.SPACING_SM.heightBox,
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: ValueListenableBuilder(
                                  valueListenable: stayConnected,
                                  builder: (context, bool stay, child) {
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                stayConnected.value = !stay;
                                                setStayConnected(
                                                    stayConnected.value);
                                              },
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 5),
                                                child: Icon(
                                                  stay
                                                      ? Icons.check_box
                                                      : Icons
                                                          .check_box_outline_blank,
                                                  color: stay
                                                      ? Theme.of(context)
                                                          .primaryColor
                                                      : Theme.of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.color,
                                                ),
                                              ),
                                            ),
                                            5.widthBox,
                                            Text(
                                              "${AppLocalizations.of(context)?.stayConnectedWord}",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            AppStyle.SPACING_SM.heightBox,
                            CustomButton(
                              title: AppLocalizations.of(context)!.continueWord,
                              titleColor: Colors.white,
                              state: state,
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  App.routeName,
                                );
                                // if (authController
                                //     .validateLogin(context)) {
                                //   _submit(
                                //     controller: authController.passWord,
                                //   );
                                // }
                              },
                              backGroundColor: Theme.of(context).primaryColor,
                            ),
                            AppStyle.SPACING_LG.heightBox,
                            Text.rich(
                              TextSpan(
                                text: AppLocalizations.of(context)!.byClicking,
                                children: [
                                  TextSpan(
                                    text: AppLocalizations.of(context)!
                                        .orCreateAccount,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        AppLocalizations.of(context)!.youAccept,
                                  ),
                                  TextSpan(
                                    // recognizer: term,
                                    text: AppLocalizations.of(context)!
                                        .termAndCondition,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  TextSpan(
                                    text: AppLocalizations.of(context)!
                                        .ofUserofApp,
                                  ),
                                ],
                              ),
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            AppStyle.SPACING_XL.heightBox,
                            Text.rich(
                              TextSpan(
                                text: AppLocalizations.of(context)!.problemWord,
                                children: [
                                  TextSpan(
                                    text: AppLocalizations.of(context)!
                                        .contacWord,
                                    //recognizer: widget.signupRecognizer,
                                    style: TextStyle(
                                      color: AppStyle.PRIMERYCOLOR,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            AppStyle.SPACING_LG.heightBox,
                          ],
                        );
                      },
                    ),
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
