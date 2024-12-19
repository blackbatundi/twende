// ignore_for_file: unnecessary_type_check

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  String _salutation = '';
  Timer? _timer;
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                appBar(),
                TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Container(),
                    Container(),
                    Container(),
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
        // body: SafeArea(
        //   child: Column(
        //     children: [
        //       appBar(),
        //       AppStyle.SPACING_LG.heightBox,
        //       Stack(
        //         children: [
        //           TabBarView(
        //             controller: _tabController,
        //             physics: const NeverScrollableScrollPhysics(),
        //             children: [
        //               Container(),
        //               Container(),
        //               Container(),
        //               Container(),
        //             ],
        //           ),
        //           Align(
        //             alignment: Alignment.bottomCenter,
        //             child: bottomNavigation(),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }

  Widget bottomNavigation() {
    return Container(
      height: 65,
      padding: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(top: BorderSide(color: Theme.of(context).disabledColor)),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
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
            padding: const EdgeInsets.all(25),
            child: Icon(
              selectedIndex == index ? selectedicon : unselectedicon,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget appBar() {
    return Column(
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
    );
  }
}
