import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tujikinge_wenyewe_responsable/controllers/bloc/bloc.dart';
import 'package:tujikinge_wenyewe_responsable/controllers/bloc/state.dart';
import 'package:tujikinge_wenyewe_responsable/services/extentions.dart';
import 'package:tujikinge_wenyewe_responsable/services/shared_prefs.dart';
import 'package:tujikinge_wenyewe_responsable/services/style.dart';
import 'package:tujikinge_wenyewe_responsable/utils/button.dart';
import 'package:tujikinge_wenyewe_responsable/views/auth/otp_page.dart';

class LogOut extends StatefulWidget {
  final String message;
  final String title;
  const LogOut({super.key, required this.message, required this.title});

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  late AppBloc bloc;

  @override
  void initState() {
    bloc = AppBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      surfaceTintColor: Theme.of(context).cardColor,
      backgroundColor: Theme.of(context).cardColor,
      titlePadding: const EdgeInsets.symmetric(vertical: 24, horizontal: 14),
      title: Text(
        textAlign: TextAlign.center,
        widget.title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      children: [
        SizedBox(
          width: 300,
          height: 150,
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 14),
            child: Column(
              children: [
                Expanded(
                  child: Text(
                    widget.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      height: 1.5,
                    ),
                  ),
                ),
                AppStyle.SPACING_LG.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: BlocListener<AppBloc, AppState>(
                        bloc: bloc,
                        listener: (context, state) {
                          if (state is SUCCESS || state is ERROR) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              OtpPage.routeName,
                              (route) => false,
                            );
                            AppPref.prefs?.clear();
                          }
                        },
                        child: BlocBuilder<AppBloc, AppState>(
                          bloc: bloc,
                          builder: (context, state) {
                            return CustomButton(
                              state: state,
                              backGroundColor: Theme.of(context).primaryColor,
                              titleColor: Colors.white,
                              title: AppLocalizations.of(context)!.yesWord,
                              onTap: () {
                                // bloc.add(Logout());
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    AppStyle.SPACING_XS.widthBox,
                    Expanded(
                      child: CustomButton(
                        backGroundColor: Theme.of(context).disabledColor,
                        title: AppLocalizations.of(context)!.noWord,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
