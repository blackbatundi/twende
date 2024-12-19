
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:twende/services/extentions.dart';

class NoData extends StatelessWidget {
  final String? title;

  const NoData({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(50),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            50.heightBox,
            Icon(
              Iconsax.folder,
              size: 30,
              color: Theme.of(context).highlightColor,
            ),
            10.heightBox,
            Text(
              title!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
