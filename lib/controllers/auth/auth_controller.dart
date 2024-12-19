import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:twende/controllers/bloc/bloc.dart';
import 'package:twende/controllers/bloc/event.dart';
import 'package:twende/utils/app_indicator.dart';

class AuthController {
  TextEditingController? email;
  TextEditingController? passWord;

  AuthController() {
    passWord = TextEditingController();
    email = TextEditingController();
  }

  // sign up validator
  bool validateGetPassword(BuildContext context) {
    if (email!.text.trim().isEmpty) {
      InfoBar(context).error(
        title: AppLocalizations.of(context)!.errorWord,
        message: AppLocalizations.of(context)!.emailSignupNameError,
      );
      return false;
    }

    return true;
  }

  bool validateLogin(BuildContext context) {
  
    if (passWord!.text.trim().isEmpty) {
      InfoBar(context).error(
        title: AppLocalizations.of(context)!.errorWord,
        message: AppLocalizations.of(context)!.passwordValidationMessage,
      );
      return false;
    }

    return true;
  }
  // get password func
  void getPassWord(AppBloc bloc) {
    bloc.add(
      SendPassWord(
        data: {
          "username": email!.text.trim(),
        },
      ),
    );
  }
  // login

}
