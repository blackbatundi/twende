import 'package:flutter/material.dart';
import 'package:twende/services/extentions.dart';
import 'package:twende/services/style.dart';

Widget appBar({required String title, BuildContext? context}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
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
            color: Theme.of(context!).cardColor,
          ),
          child: Icon(
            Icons.close,
            size: AppStyle.ICON_NX,
          ),
        ),
      ),
      AppStyle.SPACING_LG.widthBox,
      Expanded(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    ],
  );
}

Widget commonModel(
    {required String title,
    required String value,
    required BuildContext context}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 12,
          color: Theme.of(context).textTheme.bodySmall?.color,
        ),
      ),
      AppStyle.SPACING_XS.heightBox,
      Text(
        overflow: TextOverflow.ellipsis,
        value,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      )
    ],
  );
}