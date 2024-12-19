import 'package:flutter/material.dart';

class AuthController {
  String? country;
  String countryCode = "+243";
  TextEditingController? email;
  TextEditingController? userName;
  TextEditingController? phoneNumber;
  bool isSSO = false;

  String? otpCode;
  String? from;
  TextEditingController? firstName;
  TextEditingController? lastName;
  TextEditingController? oldPassword;
  TextEditingController? passWord;
  TextEditingController? confirmPassWord;
  bool isPhoneUsed = false;

  AuthController() {
    phoneNumber = TextEditingController();
    firstName = TextEditingController();
    lastName = TextEditingController();
    oldPassword = TextEditingController();
    passWord = TextEditingController();
    email = TextEditingController();
    userName = TextEditingController();
    confirmPassWord = TextEditingController();
  }

  // sign up validator
  // bool validateSignup(BuildContext context) {
  //   if (!isPhoneUsed && email!.text.trim().isEmpty) {
  //     InfoBar(context).error(
  //       title: AppLocalizations.of(context)!.errorOccured,
  //       message: AppLocalizations.of(context)!.emailSignupNameError,
  //     );
  //     return false;
  //   }

  //   if (isPhoneUsed && phoneNumber!.text.trim().isEmpty) {
  //     InfoBar(context).error(
  //       title: AppLocalizations.of(context)!.errorOccured,
  //       message: AppLocalizations.of(context)!.phoneSignupNameError,
  //     );
  //     return false;
  //   }

  //   if (passWord!.text.trim().isEmpty) {
  //     InfoBar(context).error(
  //       title: AppLocalizations.of(context)!.errorOccured,
  //       message: AppLocalizations.of(context)!.passwordEmpty,
  //     );
  //     return false;
  //   }

  //   if (confirmPassWord!.text.trim().isEmpty) {
  //     InfoBar(context).error(
  //       title: AppLocalizations.of(context)!.errorOccured,
  //       message: AppLocalizations.of(context)!.confirmpasswordEmpty,
  //     );
  //     return false;
  //   }

  //   if (passWord!.text.trim() != confirmPassWord!.text.trim()) {
  //     InfoBar(context).error(
  //       title: AppLocalizations.of(context)!.errorOccured,
  //       message: AppLocalizations.of(context)!.matchesPassword,
  //     );
  //     return false;
  //   }

  //   return true;
  // }

  // authenticate the tutor

  // bool validateOtpCode(BuildContext context) {
  //   if (otpCode == null || otpCode!.isEmpty) {
  //     InfoBar(context).error(
  //       title: AppLocalizations.of(context)!.errorOccured,
  //       message: AppLocalizations.of(context)!.emptyConfirmationCodeMessage,
  //     );
  //     return false;
  //   }
  //   if (otpCode!.length != 6) {
  //     InfoBar(context).error(
  //       title: AppLocalizations.of(context)!.errorOccured,
  //       message: AppLocalizations.of(context)!.rightConfirmationCodeMessage,
  //     );
  //     return false;
  //   }

  //   return true;
  // }

  // get otp func
  // void getOtpCode(AppBloc bloc) {
  //   bloc.add(
  //     REsendOtpCode(
  //       data: {
  //         "username":
  //             email!.text.isEmpty ? userName?.text.trim() : email!.text.trim(),
  //       },
  //     ),
  //   );
  // }

  // void confirmOtp(AppBloc bloc) {
  //   bloc.add(
  //     VerifyOTPEvent(
  //       data: {
  //         "otp": otpCode,
  //         "from": from,
  //       },
  //     ),
  //   );
  // }

  // bool validateLogin(BuildContext context) {
  //   if (phoneNumber!.text.trim().isEmpty && email!.text.trim().isEmpty) {
  //     InfoBar(context).error(
  //       title: AppLocalizations.of(context)!.errorOccured,
  //       message: AppLocalizations.of(context)!.usernameValidationMessage,
  //     );
  //     return false;
  //   }
  //   if (passWord!.text.trim().isEmpty) {
  //     InfoBar(context).error(
  //       title: AppLocalizations.of(context)!.errorOccured,
  //       message: AppLocalizations.of(context)!.passwordValidationMessage,
  //     );
  //     return false;
  //   }

  //   return true;
  // }

  // bool validateEntermail(BuildContext context) {
  //   if (userName!.text.trim().isEmpty) {
  //     InfoBar(context).error(
  //       title: AppLocalizations.of(context)!.errorOccured,
  //       message: AppLocalizations.of(context)!.usernameValidationMessage,
  //     );
  //     return false;
  //   }

  //   return true;
  // }
}
