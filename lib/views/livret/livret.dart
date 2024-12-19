import 'package:flutter/material.dart';
import 'package:tujikinge_wenyewe_responsable/services/extentions.dart';
import 'package:tujikinge_wenyewe_responsable/services/style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tujikinge_wenyewe_responsable/utils/button.dart';
import 'package:tujikinge_wenyewe_responsable/utils/widegt.dart';

class LivretMenage extends StatefulWidget {
  static String routeName = "/LivretMenage";
  const LivretMenage({super.key});

  @override
  State<LivretMenage> createState() => _LivretMenageState();
}

class _LivretMenageState extends State<LivretMenage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBar(),
              AppStyle.SPACING_LG.heightBox,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                              AppLocalizations.of(context)!.autreWord,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            ),
            child: const Icon(
              Icons.close,
              size: 16,
            ),
          ),
        ),
        AppStyle.SPACING_LG.widthBox,
        Text(
          AppLocalizations.of(context)!.livretMenageWord,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
