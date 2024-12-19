import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:twende/services/style.dart';

class ShowImage extends StatelessWidget {
  final File? imageFile;
  final String? onlineImage;
  const ShowImage({
    super.key,
    this.imageFile,
    this.onlineImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: GestureDetector(
              child: imageFile != null
                  ? Image.file(imageFile!)
                  : CachedNetworkImage(
                      imageUrl: onlineImage!,
                    ),
            ),
          ),
          Positioned(
            top: AppStyle.SPACING_3XL - 10,
            left: AppStyle.SPACING_LG,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Padding(
                padding: EdgeInsets.only(right: 10.0, bottom: 9),
                child: Icon(
                  Iconsax.arrow_circle_left,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
