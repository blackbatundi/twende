import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CustormScaffold extends StatelessWidget {
  final SafeAreaBorder? safeAreaBorder;
  final Widget body;
  const CustormScaffold({super.key, required this.body, this.safeAreaBorder});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            bottom: safeAreaBorder?.bottom ?? true,
            top: safeAreaBorder?.top ?? true,
            left: safeAreaBorder?.left ?? true,
            right: safeAreaBorder?.right ?? true,
            child: body));
  }
}

class SafeAreaBorder {
  final bool? top;
  final bool? bottom;
  final bool? left;
  final bool? right;

  const SafeAreaBorder({
    this.bottom,
    this.left,
    this.right,
    this.top,
  });
}

String formatDate(DateTime date) {
  String year = date.year.toString();
  String month = date.month.toString().padLeft(2, '0');
  String day = date.day.toString().padLeft(2, '0');

  return '$year-$month-$day';
}

String formatMonthAndDay(String dateString) {
  // Convertir la chaîne en DateTime
  DateTime date = DateTime.parse(dateString);

  // Formatter le mois et le jour
  final DateFormat formatter = DateFormat(
      'MM-dd'); // Utilisez 'M-d' si vous ne voulez pas de zéro devant les mois et jours à un chiffre
  return formatter.format(date);
}

List<Map<String, dynamic>> datesInterval(DateTime startDate, DateTime endDate) {
  List<Map<String, dynamic>> dateList = [];
  DateFormat dateFormatter = DateFormat('EEE d/M');

  DateTime currentDate = endDate;
  while (currentDate.isAfter(startDate) ||
      currentDate.isAtSameMomentAs(startDate)) {
    dateList.add(
        {'annee': currentDate.year, 'date': dateFormatter.format(currentDate)});
    currentDate = currentDate.subtract(const Duration(days: 1));
  }

  return dateList;
}

String transformDate(Map<String, dynamic> dateMap) {
  DateFormat inputFormatter = DateFormat('EEE d/M');
  DateFormat outputFormatter = DateFormat('yyyy-MM-dd');

  DateTime dateTime = inputFormatter.parse(dateMap['date']);
  DateTime fullDate = DateTime(dateMap['annee'], dateTime.month, dateTime.day);

  return outputFormatter.format(fullDate);
}

Future<dynamic> showTopSlideDialog(BuildContext context, Widget child) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true, // Allows closing the dialog when tapping outside
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54, // Background color with transparency
    transitionDuration: const Duration(milliseconds: 800), // Animation duration
    pageBuilder: (context, animation, secondaryAnimation) {
      return SafeArea(
        child: Align(
          alignment: Alignment.topCenter, // Aligns the dialog to the top
          child: Material(
            color: Colors.transparent, // Transparent background
            child: child, // The dialog content
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      // Apply the EaseInOut curve to the animation
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOutBack, // The curve for the animation
      );

      final slideAnimation = Tween<Offset>(
        begin: const Offset(0, -1), // Start from above the screen
        end: Offset.zero, // End at the original position (top of the screen)
      ).animate(curvedAnimation);

      return SlideTransition(
        position: slideAnimation,
        child: child,
      );
    },
  );
}




class CustomDate {
  final DateTime? date;
  final String? time;
  final BuildContext context;
  CustomDate({
    required this.date,
    required this.context,
    this.time,
  });
  String? fullDate;

  String get getFullDate =>
      "${getWeekDay(context)} ${date!.day.toString()} ${getMonth(context).substring(0, 3)} ${date!.year.toString()}";

  String get getFullDateWithoutWeekDay =>
      "${date!.day.toString()} ${getMonth(context).substring(0, 3)} ${date!.year.toString()}";
  String get getSimpleFullDate => "${date!.day}-${date!.month}-${date!.year}";

  String get getFullDateTime =>
      "${getWeekDay(context)} ${date!.day.toString()} ${getMonth(context)} ${date!.year.toString()} à ${date?.hour}h:${date?.minute}";

  String getMonth(BuildContext context) {
    String month = "";
    switch (date!.month) {
      case 1:
        month = AppLocalizations.of(context)!.jan;
        break;
      case 2:
        month = AppLocalizations.of(context)!.fev;
        break;
      case 3:
        month = AppLocalizations.of(context)!.marsWord;

        break;
      case 4:
        month = AppLocalizations.of(context)!.avrilWord;
        break;
      case 5:
        month = AppLocalizations.of(context)!.maiWord;
        break;
      case 6:
        month = AppLocalizations.of(context)!.juinWord;
        break;
      case 7:
        month = AppLocalizations.of(context)!.juilletWord;
        break;
      case 8:
        month = AppLocalizations.of(context)!.aoutWord;
        break;
      case 9:
        month = AppLocalizations.of(context)!.septembreWord;
        break;
      case 10:
        month = AppLocalizations.of(context)!.octobreWord;
        break;
      case 11:
        month = AppLocalizations.of(context)!.novembreWord;
        break;
      case 12:
        month = AppLocalizations.of(context)!.decembreWord;
        break;
      default:
        month = "";
    }
    return month;
  }

  String getWeekDay(BuildContext context) {
    String weekday = "";
    switch (date!.weekday) {
      case 1:
        weekday = AppLocalizations.of(context)!.lundiWord;
        break;
      case 2:
        weekday = AppLocalizations.of(context)!.mardiWord;
        break;
      case 3:
        weekday = AppLocalizations.of(context)!.mecrediWord;
        break;
      case 4:
        weekday = AppLocalizations.of(context)!.jeudiWord;
        break;
      case 5:
        weekday = AppLocalizations.of(context)!.vendrediWord;
        break;
      case 6:
        weekday = AppLocalizations.of(context)!.samediWord;
        break;
      case 7:
        weekday = AppLocalizations.of(context)!.dimancheWord;
        break;
      default:
        weekday = "";
    }
    return weekday;
  }
}

List<String> getDaysInBetween(DateTime startDate, DateTime endDate) {
  List<String> days = [];
  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    DateTime date = startDate.add(Duration(days: i));
    String month = date.month < 10 ? "0${date.month}" : "${date.month}";
    String day = date.day < 10 ? "0${date.day}" : "${date.day}";
    days.add("$day-$month-${date.year}");
  }
  return days;
}
