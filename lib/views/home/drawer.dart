import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tujikinge_wenyewe_responsable/services/extentions.dart';
import 'package:tujikinge_wenyewe_responsable/services/style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tujikinge_wenyewe_responsable/utils/functions.dart';
import 'package:tujikinge_wenyewe_responsable/utils/widegt.dart';
import 'package:tujikinge_wenyewe_responsable/views/activite/activite.dart';
import 'package:tujikinge_wenyewe_responsable/views/auth/logout/logout.dart';
import 'package:tujikinge_wenyewe_responsable/views/home/home.dart';
import 'package:tujikinge_wenyewe_responsable/views/livret/livret.dart';
import 'package:tujikinge_wenyewe_responsable/views/membre/membre.dart';
import 'package:tujikinge_wenyewe_responsable/views/situation_de_demenagement/situation_de_demenagement.dart';

const int creationDate = 1701083574643;

class DrawerApp extends StatefulWidget {
  const DrawerApp({super.key});

  @override
  State<DrawerApp> createState() => _DrawerState();
}

class _DrawerState extends State<DrawerApp> {
  String _salutation = '';
  Timer? _timer;
  DateTime? startDate;
  DateTime? endDate;
  @override
  void initState() {
    endDate = DateTime.now();
    startDate = endDate!.subtract(const Duration(days: 7));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (mounted) {
      _updateSalutation();
      _startTimer();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      _updateSalutation();
    });
  }

  void _updateSalutation() {
    final hour = DateTime.now().hour;
    String newSalutation;

    if (hour < 12) {
      newSalutation = AppLocalizations.of(context)!.greetings1;
    } else if (hour < 18) {
      newSalutation = AppLocalizations.of(context)!.greetings2;
    } else {
      newSalutation = AppLocalizations.of(context)!.greetings3;
    }

    if (newSalutation != _salutation) {
      setState(() {
        _salutation = newSalutation;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width - 50,
        decoration: BoxDecoration(
          //color: Theme.of(context).dialogBackgroundColor,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppStyle.SPACING_2XL.heightBox,
            AppStyle.SPACING_LG.heightBox,
            appBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(
                  AppStyle.SPACING_XL,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    menu(
                      title: AppLocalizations.of(context)!.informationWord,
                      onTap: () {
                        Navigator.pushNamed(context, App.routeName);
                      },
                    ),
                    menu(
                      title: AppLocalizations.of(context)!.infoLivretWord,
                      onTap: () {
                        Navigator.pushNamed(context, LivretMenage.routeName);
                      },
                    ),
                    menu(
                      title: AppLocalizations.of(context)!.activiteWord,
                      onTap: () {
                        Navigator.pushNamed(context, Activite.routeName);
                      },
                    ),
                    menu(
                      title: AppLocalizations.of(context)!.situationWord,
                      onTap: () {
                        Navigator.pushNamed(
                            context, SituationdeMenage.routeName);
                      },
                    ),
                    menu(
                      title: AppLocalizations.of(context)!.membreWord,
                      onTap: () {
                        Navigator.pushNamed(context, Membre.routeName);
                      },
                    ),
                    menu(title: AppLocalizations.of(context)!.settingsWord),
                    menu(
                      title: AppLocalizations.of(context)!.logoutWord,
                      onTap: () {
                        showTopSlideDialog(
                          context,
                          LogOut(
                            message:
                                AppLocalizations.of(context)!.logoutQuestion,
                            title: AppLocalizations.of(context)!.logoutWord,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: _buildSegment(
                      context: context,
                      label: "Unite",
                      backgroundColor: isDarkMode(context)
                          ? const Color(0xFF4F1412)
                          : Colors.pink[100],
                      textColor:
                          isDarkMode(context) ? Colors.white : Colors.black,
                    ),
                  ),
                  Expanded(
                    child: _buildSegment(
                      context: context,
                      label: "Controle",
                      backgroundColor: isDarkMode(context)
                          ? const Color(0xFF5E4B12)
                          : Colors.amber[100],
                      textColor:
                          isDarkMode(context) ? Colors.white : Colors.black,
                    ),
                  ),
                  Expanded(
                    child: _buildSegment(
                      context: context,
                      label: "Surveillance",
                      backgroundColor: isDarkMode(context)
                          ? const Color(0xFF111832)
                          : Colors.blue[100],
                      textColor:
                          isDarkMode(context) ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSegment(
      {String? label,
      Color? backgroundColor,
      Color? textColor,
      BuildContext? context}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Text(
        textAlign: TextAlign.center,
        label!,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: EdgeInsets.only(
        left: AppStyle.SPACING_XL,
        right: AppStyle.SPACING_SM,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _salutation,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                ),
                const Text(
                  "John Doe",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,

                color: Theme.of(context).cardColor,
                // borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.close,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget menu({required String title, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
