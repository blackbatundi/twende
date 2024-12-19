// ignore_for_file: unnecessary_type_check

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:twende/services/extentions.dart';
import 'package:twende/services/style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
   
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              appBar(),
              AppStyle.SPACING_LG.heightBox,
             
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

}
