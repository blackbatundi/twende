import 'package:flutter/material.dart';
import 'package:tujikinge_wenyewe_responsable/services/extentions.dart';
import 'package:tujikinge_wenyewe_responsable/services/style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tujikinge_wenyewe_responsable/utils/button.dart';

class Membre extends StatefulWidget {
  static String routeName = "/Membre";
  const Membre({super.key});

  @override
  State<Membre> createState() => _MembreState();
}

class _MembreState extends State<Membre> {
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
                      ...List.generate(
                        3,
                        (index) => parentsModel(),
                      ),
                    ],
                  ),
                ),
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
          AppLocalizations.of(context)!.membreWord,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
