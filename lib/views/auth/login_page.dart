import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:twende/controllers/auth/auth_controller.dart';
import 'package:twende/controllers/bloc/bloc.dart';
import 'package:twende/controllers/bloc/state.dart';
import 'package:twende/services/extentions.dart';
import 'package:twende/services/style.dart';
import 'package:twende/utils/app_indicator.dart';
import 'package:twende/utils/button.dart';
import 'package:twende/utils/widegt.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:twende/views/auth/otp_page.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/LoginPage";
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                            phoneChange(),
                            AppStyle.SPACING_LG.heightBox,
                            CustomButton(
                              title: AppLocalizations.of(context)!.continueWord,
                              titleColor: Colors.white,
                              state: state,
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                   OtpPage.routeName,
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

  Widget phoneChange() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).disabledColor,
            borderRadius: BorderRadius.circular(AppStyle.RADIUS_LG),
          ),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isPhoneSelected = true;
                      authController.isPhoneUsed =
                          true; // Logic from username()
                    });
                  },
                  borderRadius: BorderRadius.circular(AppStyle.RADIUS_LG),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        color: isPhoneSelected
                            ? Theme.of(context).primaryColor
                            : null,
                        borderRadius: isPhoneSelected
                            ? BorderRadius.circular(AppStyle.RADIUS_LG)
                            : null),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone_android,
                          color: isPhoneSelected ? AppStyle.WHITE : null,
                        ),
                        AppStyle.SPACING_SM.widthBox,
                        Text(
                          "phonNumber",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isPhoneSelected ? AppStyle.WHITE : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isPhoneSelected = false;
                      authController.isPhoneUsed =
                          false; // Logic from username()
                    });
                  },
                  borderRadius: BorderRadius.circular(AppStyle.RADIUS_LG),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: !isPhoneSelected
                          ? Theme.of(context).primaryColor
                          : null,
                      borderRadius: !isPhoneSelected
                          ? BorderRadius.circular(AppStyle.RADIUS_LG)
                          : null,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mail_outlined,
                          color: !isPhoneSelected ? AppStyle.WHITE : null,
                        ),
                        AppStyle.SPACING_SM.widthBox,
                        Text(
                          "email",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: !isPhoneSelected ? AppStyle.WHITE : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        AppStyle.SPACING_XL.heightBox,
        authController.isPhoneUsed
            ? TextFormField(
                inputFormatters: [
                  MaskTextInputFormatter(
                    mask: '#########',
                    filter: {
                      "#": RegExp(r'\d'),
                    },
                  )
                ],
                controller: authController.phoneNumber,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(17.0),
                  hintText: "Entrer votre numero telephone",
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  labelStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  labelText: "Numero telephone",
                  prefixIcon: InkWell(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        countryListTheme: CountryListThemeData(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                        ),
                        showPhoneCode: true,
                        onSelect: (Country country) {
                          setState(() {
                            authController.countryCode =
                                "+${country.phoneCode}";
                          });
                        },
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        10.widthBox,
                        Text(
                          authController.countryCode,
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down),
                        10.widthBox,
                      ],
                    ),
                  ),
                ),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              )
            : SimpleTextField(
                labelText: "email",
                hintText: "Entre votre email",
                controller: authController.email,
                icon: Icons.mail_outlined,
              ),
      ],
    );
  }
}
