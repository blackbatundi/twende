// ignore_for_file: unnecessary_type_check

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:twende/views/home/find_place_to_go.dart';
import 'package:twende/views/setting/setting.dart';
import 'package:twende/views/tripe/my_ride.dart';

List<IconData> selectedicons = [
  Iconsax.home_15,
  Iconsax.task_square5,
  Iconsax.profile_circle5,
];
List<IconData> unselectedicons = [
  Iconsax.home,
  Iconsax.task_square,
  Iconsax.profile_circle,
];

class App extends StatefulWidget {
  static String routeName = "/app";
  const App({super.key});
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {

  DateTime? startDate;
  DateTime? endDate;
  TabController? _tabController;
  String selectMenu = "home";
  @override
  void initState() {
    endDate = DateTime.now();
    startDate = endDate!.subtract(const Duration(days: 7));
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    super.initState();
  }

  int? selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _homeTab(context),
                  const MyRide(),
                  const Settings(),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: bottomNavigation(),
              ),
            ],
          ),
        ),
      ),
    );
  }





  Widget bottomNavigation() {
    return Container(
      height: 65,
      padding: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        // borderRadius: BorderRadius.circular(8),
        border: Border(top: BorderSide(color: Theme.of(context).disabledColor)),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 50,
        children: List.generate(
          selectedicons.length,
          (index) => modelIcon(
            selectedicon: selectedicons[index],
            unselectedicon: unselectedicons[index],
            index: index,
          ),
        ),
      ),
    );
  }

  modelIcon({
    IconData? selectedicon,
    IconData? unselectedicon,
    required index,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;

          _tabController!.animateTo(index);
        });
      },
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Icon(
              selectedIndex == index ? selectedicon : unselectedicon,
              color: Theme.of(context).cardColor,
            ),
          ),
        ],
      ),
    );
  }
}
