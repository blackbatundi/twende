import 'package:flutter/material.dart';
import 'package:tujikinge_wenyewe_responsable/services/extentions.dart';
import 'package:tujikinge_wenyewe_responsable/services/style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tujikinge_wenyewe_responsable/utils/button.dart';

class Activite extends StatefulWidget {
  static String routeName = "/Activite";
  const Activite({super.key});

  @override
  State<Activite> createState() => _ActiviteState();
}

class _ActiviteState extends State<Activite> {
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppStyle.SPACING_2XL.heightBox,
                      modelActuel(
                        context,
                        icon: Icons.location_on,
                        title: "Kyeshero, Goma",
                        subtitle: "Visiteur",
                        description:
                            "Je me rends à [lieu] le [date] pour [motif de la visite], afin de [objectif spécifique de la visite]",
                        duration: "17 jours",
                        additionalText: "Localisation actuelle",
                        personName: "Johnathan Louis",
                        personRole: "Responsable",
                      ),
                      10.heightBox,
                      modelPasVisiteur(
                        context,
                        icon: Icons.home,
                        title: "Kyeshero, Goma",
                        subtitle: "Pas visiteur",
                        description:
                            "Je me rends à [lieu] le [date]Je me rends à [lieu] le [date]Je me rends à [lieu] le [date] pour [motif de la visite], afin de",
                        duration: "17 jours",
                        additionalText: "Serena hotel - Goma",
                        date: "Mardi le 11 Juin 2010",
                        adress:
                            "13, Av la corniche, Le volcan, Goma, Nord-kivu",
                      ),
                      10.heightBox,
                      modelHotel(
                        context,
                        icon: Icons.hotel,
                        title: "Serena hotel",
                        subtitle: "Le volcan, Goma",
                        description:
                            "13, Av la corniche, Le volcan, Goma, Nord-kivu",
                        duration: "4 jours",
                        firstdate: "11 Juin 2010 ",
                        seconddate: "13 Juin 2010",
                        roomNumber: "14",
                        email: "mail@exemple.com",
                        phoneNumber: "(+243) 974-101-201",
                      ),
                      10.heightBox,
                      modelVisiteur(
                        context,
                        icon: Icons.calendar_today,
                        title: "Himbi",
                        subtitle: "visiteur",
                        description:
                            "Je me rends à [lieu] le [date]Je me rends à [lieu] le [date]Je me rends à [lieu] le [date] pour [motif de la visite], afin de",
                        duration: "17 jours",
                        additionaltitle: "Le volcan",
                        additionalsubtitle: "Le volcan",
                        additionalDescription:
                            "Je me rends à [lieu] le [date]Je me rends à [lieu] le [date]Je me rends à [lieu] le [date] pour [motif de la visite], afin de",
                        date: "Mardi le 11 Juin 2010",
                      ),
                      AppStyle.SPACING_LG.heightBox,
                    ],
                  ),
                ),
              ),
              AppStyle.SPACING_XS.heightBox,
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

  Widget modelActuel(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String description,
    required String duration,
    String? additionalText,
    String? personName,
    String? personRole,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titre et sous-titre
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                "$title ",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "- $subtitle",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.more_vert,
                          size: 20,
                        ),
                      ],
                    ),
                    AppStyle.SPACING_SM.heightBox,
                    Text(
                      description,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                        fontSize: 12,
                      ),
                    ),
                    AppStyle.SPACING_SM.heightBox,
                    Row(
                      children: [
                        Text(
                          duration,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 10),
                        if (additionalText != null)
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).disabledColor,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                additionalText,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.red.withOpacity(0.5),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                    AppStyle.SPACING_SM.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/icons/pic.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        AppStyle.SPACING_SM.widthBox,
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                personName!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                              AppStyle.SPACING_SM.widthBox,
                              Text(
                                " - $personRole",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -20,
          left: 15,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
            ),
            child: const Icon(
              Icons.location_on,
              color: Colors.white,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget modelPasVisiteur(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String description,
    required String duration,
    String? additionalText,
    String? date,
    String? adress,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 35,
          top: -10,
          bottom: 10,
          child: Container(
            width: 3,
            color: const Color(0xFF7DB8A9).withOpacity(0.3),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 30,
          ),
          padding: const EdgeInsets.only(top: 10),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            description,
                            style: TextStyle(
                              fontSize: 12,
                              color:
                                  Theme.of(context).textTheme.bodySmall?.color,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.more_vert,
                          size: 20,
                        ),
                      ],
                    ),
                    AppStyle.SPACING_SM.heightBox,
                    Row(
                      children: [
                        Text(
                          "$title ",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "- $subtitle",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodySmall?.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    AppStyle.SPACING_SM.heightBox,
                    if (date != null)
                      Text(
                        "$date - $duration",
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                      ),
                    AppStyle.SPACING_LG.heightBox,
                    Container(
                      height: 1.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Theme.of(context).disabledColor.withOpacity(.5),
                      ),
                    ),
                    AppStyle.SPACING_LG.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          additionalText!,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodySmall?.color,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          date!,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodySmall?.color,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    AppStyle.SPACING_SM.heightBox,
                    Text(
                      adress!,
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
        ),
        Positioned(
          top: 10, // Décalage vers le haut
          left: 15,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFF7DB8A9),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget modelHotel(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String description,
    required String duration,
    String? firstdate,
    String? seconddate,
    String? email,
    String? roomNumber,
    String? phoneNumber,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 35,
          top: -10,
          bottom: 10,
          child: Container(
            width: 3,
            color: Colors.orange.withOpacity(0.3),
          ),
        ),
        // Carte avec le contenu
        Container(
          margin: const EdgeInsets.only(
            top: 30,
          ),
          padding: const EdgeInsets.only(top: 10),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                "$title ",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "- $subtitle",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.color,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.more_vert,
                          size: 20,
                        ),
                      ],
                    ),
                    AppStyle.SPACING_SM.heightBox,
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                    ),
                    AppStyle.SPACING_SM.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Du",
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.color,
                              ),
                            ),
                            AppStyle.SPACING_XS.heightBox,
                            Text(
                              "$firstdate",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Au",
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.color,
                              ),
                            ),
                            AppStyle.SPACING_XS.heightBox,
                            Text(
                              "$seconddate",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Durée",
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.color,
                              ),
                            ),
                            AppStyle.SPACING_XS.heightBox,
                            Text(
                              duration,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    AppStyle.SPACING_LG.heightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.bed,
                          size: 20,
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                        AppStyle.SPACING_SM.widthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Chambre",
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.color,
                              ),
                            ),
                            AppStyle.SPACING_SM.widthBox,
                            Text(
                              "$roomNumber",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    AppStyle.SPACING_LG.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.phone,
                              size: 16,
                              color:
                                  Theme.of(context).textTheme.bodySmall?.color,
                            ),
                            AppStyle.SPACING_SM.widthBox,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Telephone",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.color,
                                  ),
                                ),
                                AppStyle.SPACING_SM.widthBox,
                                Text(
                                  "$phoneNumber",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.color,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.color,
                              ),
                            ),
                            AppStyle.SPACING_XS.heightBox,
                            Text(
                              "$email",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.color,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10, // Décalage vers le haut
          left: 15,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget modelVisiteur(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String description,
    required String duration,
    required String additionaltitle,
    required String additionalsubtitle,
    String? additionalDescription,
    String? date,
    bool isHotel = false,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 35,
          top: -10,
          bottom: 10,
          child: Container(
            width: 3,
            color: const Color(0xFF7DB8A9).withOpacity(0.3),
          ),
        ),
        // Carte avec le contenu
        Container(
          margin: const EdgeInsets.only(
            top: 30,
          ),
          padding: const EdgeInsets.only(top: 10),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                "$title ",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "- $subtitle",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.more_vert,
                          size: 20,
                        )
                      ],
                    ),
                    AppStyle.SPACING_SM.heightBox,
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                    ),
                    AppStyle.SPACING_SM.heightBox,
                    Row(
                      children: [
                        Text(
                          "$date ",
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "- $duration",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodySmall?.color,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    AppStyle.SPACING_SM.heightBox,
                    Container(
                      height: 1.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Theme.of(context).disabledColor.withOpacity(.5),
                      ),
                    ),
                    AppStyle.SPACING_SM.heightBox,
                    Row(
                      children: [
                        Text(
                          "$additionaltitle ",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "- $additionalsubtitle",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodySmall?.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    AppStyle.SPACING_SM.heightBox,
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                    ),
                    AppStyle.SPACING_SM.heightBox,
                    Row(
                      children: [
                        Text(
                          "$date ",
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "- $duration",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodySmall?.color,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10, // Décalage vers le haut
          left: 15,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFF7DB8A9),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 16,
            ),
          ),
        ),
      ],
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
          AppLocalizations.of(context)!.activiteWord,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
