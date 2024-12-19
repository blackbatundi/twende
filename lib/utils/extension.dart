import 'package:flutter/material.dart';

extension SpacerWidget on num {
  Widget get heightBox => SizedBox(
        height: double.parse(toString()),
      );

  Widget get widthBox => SizedBox(
        width: double.parse(toString()),
      );
}

extension ColorFromString on String {
  /// Converts a hex color string to a [Color] object.
  /// The string can be in the format '#RRGGBB' or 'RRGGBB'.
  Color toColor() {
    // Remove the leading '#' if present
    String hexString = replaceAll('#', '');

    // Ensure the string is valid
    if (hexString.length != 6 && hexString.length != 8) {
      throw const FormatException('Invalid hex color format');
    }

    // If the string has 6 characters, add alpha value (FF)
    if (hexString.length == 6) {
      hexString = 'FF$hexString';
    }

    // Convert the hex string to an integer
    int colorInt = int.parse(hexString, radix: 16);

    // Create and return a Color object
    return Color(colorInt);
  }
}
