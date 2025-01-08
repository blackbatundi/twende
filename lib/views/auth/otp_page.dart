import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:twende/controllers/auth/auth_controller.dart';
import 'package:twende/controllers/bloc/bloc.dart';
import 'package:twende/controllers/bloc/state.dart';
import 'package:twende/services/extentions.dart';
import 'package:twende/services/style.dart';
import 'package:twende/utils/app_indicator.dart';
import 'package:twende/utils/button.dart';
import 'package:twende/views/auth/login_page.dart';
import 'package:twende/views/home/home.dart';

class OtpPage extends StatefulWidget {
  static String routeName = "/OtpPage";
  const OtpPage({super.key});
  @override
  State<OtpPage> createState() => _OtpPage();
}

class _OtpPage extends State<OtpPage> {
  ValueNotifier<bool> stayConnected = ValueNotifier(false);
  AuthController authController = AuthController();
  late AppBloc bloc;

  @override
  void initState() {
    bloc = AppBloc();

    super.initState();
  }

  bool isPhoneSelected = false;
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
                          LoginPage.routeName,
                          //arguments: authController.email!.value.text.trim(),
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
                          // mainAxisAlignment: MainAxisAlignment.center,
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
                            PinCodeTextField(
                              errorTextSpace: 0,
                              appContext: context,
                              length: 6,
                              obscureText: false,
                              autoDismissKeyboard: false,
                              keyboardType: TextInputType.number,
                              animationType: AnimationType.fade,
                              // controller: sendcode,
                              pinTheme: PinTheme(
                                inactiveFillColor: Colors.white,
                                selectedColor: Colors.black,
                                borderWidth: 1,
                                selectedFillColor: Colors.white,
                                inactiveColor: Colors.grey.withOpacity(0.2),
                                activeColor: Colors.grey.withOpacity(0.3),
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 50,
                                fieldWidth: 50,
                                activeFillColor: Colors.white,
                              ),
                              enableActiveFill: true,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              backgroundColor: Colors.transparent,
                              autoFocus: true,
                              onCompleted: (otpCode) {
                                //_submit(otpCode);
                              },
                              onChanged: (value) {
                                setState(() {});
                              },
                              beforeTextPaste: (text) {
                                return true;
                              },
                            ),
                            AppStyle.SPACING_LG.heightBox,
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
                                //     .validateGetPassword(context)) {
                                //   authController.getPassWord(bloc);
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
                AppLocalizations.of(context)!.blackSolgan,
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
