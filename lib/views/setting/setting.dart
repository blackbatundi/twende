import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax/iconsax.dart';
import 'package:twende/services/extentions.dart';
import 'package:twende/services/style.dart';
import 'package:twende/services/widget.dart';
import 'package:twende/utils/functions.dart';
import 'package:twende/views/setting/logout/logout.dart';

class Settings extends StatefulWidget {
  static String routeName = "/Settings";
  const Settings({super.key});
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox.shrink(),
                  Expanded(
                    child: Text(
                      "Paramettre",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
              AppStyle.SPACING_XL.heightBox,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Iconsax.user,
                          size: AppStyle.ICON_XL,
                        ),
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
                            AppStyle.SPACING_XL.heightBox,
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    "Editer les information",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Iconsax.edit,
                                  size: AppStyle.ICON_NX,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      AppStyle.SPACING_XL.heightBox,
                      InkWell(
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
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 29,
                            horizontal: 29,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Deconnexion",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.logout,
                                size: AppStyle.ICON_NX,
                              ),
                            ],
                          ),
                        ),
                      ),
                      AppStyle.SPACING_LG.heightBox,
                      InkWell(
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
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 29,
                            horizontal: 29,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "Delete account ",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.logout,
                                size: AppStyle.ICON_NX,
                              ),
                            ],
                          ),
                        ),
                      ),
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
}
