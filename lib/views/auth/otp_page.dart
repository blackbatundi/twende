import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tujikinge_wenyewe_responsable/controllers/auth/auth_controller.dart';
import 'package:tujikinge_wenyewe_responsable/controllers/bloc/bloc.dart';
import 'package:tujikinge_wenyewe_responsable/controllers/bloc/state.dart';
import 'package:tujikinge_wenyewe_responsable/services/extentions.dart';
import 'package:tujikinge_wenyewe_responsable/services/style.dart';
import 'package:tujikinge_wenyewe_responsable/utils/app_indicator.dart';
import 'package:tujikinge_wenyewe_responsable/utils/button.dart';
import 'package:tujikinge_wenyewe_responsable/utils/widegt.dart';
import 'package:tujikinge_wenyewe_responsable/views/auth/login_page.dart';

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
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/icons/logo.png",
                                  ),
                                ),
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
                            SimpleTextField(
                              labelText:
                                  AppLocalizations.of(context)!.cardNumberWord,
                              hintText:
                                  AppLocalizations.of(context)!.cardNumberWord,
                              icon: Iconsax.message,
                              controller: authController.email,
                            ),
                            AppStyle.SPACING_LG.heightBox,
                            CustomButton(
                              title: AppLocalizations.of(context)!.continueWord,
                              titleColor: Colors.white,
                              state: state,
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  LoginPage.routeName,
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
              footer(context),
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
