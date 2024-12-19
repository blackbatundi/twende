import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class CustomOpenContainer extends StatelessWidget {
  final Widget Function(BuildContext context, VoidCallback openContainer)
      closedBuilder;
  final Widget openPage;
  final Color? openColor;
  final Color? closeColor;
  final double? closedElevation;
  final double? borderRadius;
  final Duration? transitionDuration;
  final Function(Object?)? onClosed;

  const CustomOpenContainer({
    super.key,
    required this.closedBuilder,
    required this.openPage,
    this.closedElevation,
    this.borderRadius,
    this.openColor,
    this.onClosed,
    this.closeColor,
    this.transitionDuration,
  });

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      onClosed: (r) {
        onClosed?.call(r);
      },
      transitionType:
          ContainerTransitionType.fade, // You can change this as needed
      transitionDuration:
          transitionDuration ?? const Duration(milliseconds: 600),
      openBuilder: (context, _) => openPage,
      closedElevation: closedElevation ?? 0,
      openElevation: 0,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
      openShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
      middleColor: Colors.black,
      openColor: openColor ?? Colors.transparent,
      closedColor: closeColor ?? Colors.transparent,
      closedBuilder: closedBuilder,
    );
  }
}
