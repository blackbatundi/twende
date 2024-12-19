import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:twende/controllers/auth/auth_controller.dart';
import 'package:twende/services/extentions.dart';
import 'package:twende/services/style.dart';
import 'package:twende/utils/button.dart';
import 'package:twende/utils/widegt.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/LoginPage";
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthController authController = AuthController();
  bool isPhoneSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Text(
            "loginWelcomeText",
            style: TextStyle(
              color: Theme.of(context).textTheme.displaySmall?.color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ),
          AppStyle.SPACING_XL.heightBox,
          phoneChange(),
          AppStyle.SPACING_XL.heightBox,
          CustomButton(
            title: "loginWord",
            onTap: () {},
            backGroundColor: Theme.of(context).primaryColor,
          ),
          AppStyle.SPACING_LG.heightBox,
        ],
      ),
    ));
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
