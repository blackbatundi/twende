// ignore_for_file: unnecessary_type_check

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tujikinge_wenyewe_responsable/services/extentions.dart';
import 'package:tujikinge_wenyewe_responsable/services/style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tujikinge_wenyewe_responsable/utils/button.dart';
import 'package:tujikinge_wenyewe_responsable/utils/widegt.dart';

class App extends StatefulWidget {
  static String routeName = "/app";
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
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
      drawer: drawer(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              appBar(),
              AppStyle.SPACING_LG.heightBox,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/icons/pic.jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      AppStyle.SPACING_XS.heightBox,
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "John Doe",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              AppStyle.SPACING_SM.widthBox,
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                      ),
                                    ),
                                    AppStyle.SPACING_SM.widthBox,
                                    const Text(
                                      "Vivant",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          AppStyle.SPACING_XS.heightBox,
                          Text(
                            "123, Boulevard du 30 Juin",
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodySmall?.color,
                              fontSize: 12,
                            ),
                          ),
                          AppStyle.SPACING_XS.heightBox,
                          Text(
                            "Homme",
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodySmall?.color,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      AppStyle.SPACING_XL.heightBox,
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 29,
                          horizontal: 29,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.infoBasiqueWord,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            AppStyle.SPACING_XL.heightBox,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonModel(
                                      context: context,
                                      title:
                                          AppLocalizations.of(context)!.nomWord,
                                      value: "John",
                                    ),
                                    AppStyle.SPACING_LG.heightBox,
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .postNomWord,
                                      value: "Doe",
                                    ),
                                    AppStyle.SPACING_LG.heightBox,
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .prenomWord,
                                      value: "Black",
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .dateNaissanceWord,
                                      value: "13/08/1998",
                                    ),
                                    AppStyle.SPACING_LG.heightBox,
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .lieuNaissanceWord,
                                      value: "Goma",
                                    ),
                                    AppStyle.SPACING_LG.heightBox,
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .etatCivilWord,
                                      value: "Marie",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      AppStyle.SPACING_2XL.heightBox,
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 29,
                          horizontal: 29,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.adresseWord,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            AppStyle.SPACING_XL.heightBox,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .provinceWord,
                                      value: "Nord-kivu",
                                    ),
                                    AppStyle.SPACING_LG.heightBox,
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .villeWord,
                                      value: "Goma",
                                    ),
                                    AppStyle.SPACING_LG.heightBox,
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .communeWord,
                                      value: "Karisimbi",
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .quartierWord,
                                      value: "Goma | 68910",
                                    ),
                                    AppStyle.SPACING_LG.heightBox,
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .avenueNUmeroWord,
                                      value: "Des enseignant, \nNum 62",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      AppStyle.SPACING_2XL.heightBox,
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 29,
                          horizontal: 29,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .origineNationaliteWord,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            AppStyle.SPACING_XL.heightBox,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .nationaliteWord,
                                      value: "Congolaise",
                                    ),
                                    AppStyle.SPACING_LG.heightBox,
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .paysWord,
                                      value: "Rep.Dem du Congo",
                                    ),
                                    AppStyle.SPACING_LG.heightBox,
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .provinceWord,
                                      value: "Nord-kivu",
                                    ),
                                    AppStyle.SPACING_LG.heightBox,
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .territoireWord,
                                      value: "Walikale",
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .secteurChefferieWord,
                                      value: "Wanianga",
                                    ),
                                    AppStyle.SPACING_LG.heightBox,
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .groupementWord,
                                      value: "Groupement",
                                    ),
                                    AppStyle.SPACING_LG.heightBox,
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .villageWord,
                                      value: "Village",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      AppStyle.SPACING_2XL.heightBox,
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 29,
                          horizontal: 29,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .etudeFaiteProfessionWord,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            AppStyle.SPACING_XL.heightBox,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .institutionWord,
                                      value: "ISTA",
                                    ),
                                    AppStyle.SPACING_LG.heightBox,
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .anneeWord,
                                      value: "2020",
                                    ),
                                    AppStyle.SPACING_LG.heightBox,
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .etudeFaiteWord,
                                      value: "Informatique Applique",
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .professionWord,
                                      value: "Ingenieur Technicien",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      AppStyle.SPACING_2XL.heightBox,
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 29,
                          horizontal: 29,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.contactWord,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            AppStyle.SPACING_XL.heightBox,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .telephoneWord,
                                      value: "+243 (0) 974 872 763",
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonModel(
                                      context: context,
                                      title: AppLocalizations.of(context)!
                                          .entrerYourMailLabel,
                                      value: "exemple@domain.com",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      AppStyle.SPACING_2XL.heightBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.parentWord,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          AppStyle.SPACING_XL.heightBox,
                          ...List.generate(
                            2,
                            (index) => parentsModel(),
                          ),
                        ],
                      ),
                      AppStyle.SPACING_LG.heightBox,
                      CustomButton(
                        title: AppLocalizations.of(context)!.askModifWord,
                        titleColor: Colors.white,
                        onTap: () {},
                        backGroundColor: Theme.of(context).primaryColor,
                      ),
                      AppStyle.SPACING_LG.heightBox,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Row(
      children: [
        Builder(
          builder: (context) {
            return InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.menu,
                  size: 16,
                ),
              ),
            );
          },
        ),
        AppStyle.SPACING_LG.widthBox,
        Column(
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
      ],
    );
  }

  Widget parentsModel() {
    return Container(
      margin: EdgeInsets.only(
        bottom: AppStyle.SPACING_XL,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.16),
            offset: const Offset(0, 3),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 95,
            width: 95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: const DecorationImage(
                image: AssetImage(
                  "assets/icons/pic.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AppStyle.SPACING_XL.widthBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "John Doe",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppStyle.SPACING_SM.heightBox,
                Text(
                  "Pere",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppStyle.SPACING_SM.heightBox,
                Text(
                  "Ne a Buina, le 13/07/2001",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
