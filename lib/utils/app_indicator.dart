// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class InfoBar {
  late BuildContext context;
  InfoBar(BuildContext ctx) {
    context = ctx;
  }

  showToast({
    String? title,
    String? message,
    Color? backgroundcolor,
    Color? textColor,
    int? seconde,
  }) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: backgroundcolor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(.1),
            blurRadius: 5,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$title",
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            "$message",
            style: TextStyle(
              color: textColor,
              height: 1.5,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
    showToastWidget(
      toast,
      context: context,
      duration: Duration(seconds: seconde ?? 3),
      animation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.top,
      animDuration: const Duration(milliseconds: 500),
    );
  }

  info({
    String? message,
    String? title,
  }) {
    showToast(
      message: message,
      title: title,
      backgroundcolor: Theme.of(context).dialogBackgroundColor,
      seconde: 5,
    );
  }

  error({
    String? message,
    String? title,
    int? time,
  }) {
    showToast(
      message: message,
      title: title,
      textColor: Colors.white,
      backgroundcolor: const Color.fromARGB(255, 162, 39, 39),
      seconde: time,
    );
  }

  success({
    String? message,
    String? title,
  }) {
    showToast(
      message: message,
      title: title,
      backgroundcolor: Theme.of(context).cardColor,
      seconde: 5,
    );
  }
}
