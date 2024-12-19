import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  String get getDayAndMonth => "${date!.day.toString()} ${getMonth(context)}";

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
