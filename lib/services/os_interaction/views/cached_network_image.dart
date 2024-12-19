import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWithErrorHandling extends StatefulWidget {
  final EdgeInsets? padding;
  final Color? bgColor;
  final String? fullImage;
  final int size;
  final String? imgType;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final Widget? child;
  final Alignment? alignment;
  final bool? usImageSize;
  final List<BoxShadow>? boxshadow;

  const CachedNetworkImageWithErrorHandling({
    super.key,
    this.padding,
    this.fullImage,
    required this.size,
    this.bgColor,
    this.usImageSize,
    this.imgType,
    this.height,
    this.width,
    this.borderRadius,
    this.alignment,
    this.child,
    this.boxshadow,
  });

  @override
  State<CachedNetworkImageWithErrorHandling> createState() =>
      _CachedNetworkImageWithErrorHandlingState();
}

class _CachedNetworkImageWithErrorHandlingState
    extends State<CachedNetworkImageWithErrorHandling> {
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.zero,
      child: widget.usImageSize == true
          ? CachedNetworkImage(
              imageUrl: widget.fullImage ?? "",
              errorListener: (value) {
                setState(() {
                  _hasError = true;
                });
              },
            )
          : Container(
              padding: widget.padding,
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.bgColor ?? Theme.of(context).disabledColor,
                image: decorationImage(),
                boxShadow: widget.boxshadow,
              ),
              child: _hasError ? errorWidget() : widget.child,
            ),
    );
  }

  Widget errorWidget() {
    switch (widget.imgType) {
      case "image":
        return Image.asset(
          "assets/images/default/${widget.size}/default_cobiz.png",
          fit: BoxFit.cover,
        );

      case "video":
        return Image.asset(
          "assets/images/default/${widget.size}/default_cobiz.png",
          fit: BoxFit.cover,
        );

      case "user":
        return Image.asset(
          "assets/images/default/${widget.size}/default_cobiz.png",
          fit: BoxFit.cover,
        );

      default:
        return Image.asset(
          "assets/images/default/1080/default_cobiz.png",
          fit: BoxFit.cover,
        );
    }
  }

  DecorationImage? decorationImage() {
    ImageProvider? providerImage;

    if (widget.fullImage != null) {
      providerImage = CachedNetworkImageProvider(widget.fullImage!);
    }
    if (providerImage == null) {
      switch (widget.imgType) {
        case "image":
          providerImage = AssetImage(
            "assets/images/default/${widget.size}/default_cobiz.png",
          );
          break;
        case "video":
          providerImage = AssetImage(
            "assets/images/default/${widget.size}/default_cobiz.png",
          );
          break;
        case "user":
          providerImage = AssetImage(
            "assets/images/default/${widget.size}/default_cobiz.png",
          );

          break;
        default:
          providerImage = const AssetImage(
            "assets/images/default/1080/default_cobiz.png",
          );
      }
    }
    return DecorationImage(
      image: providerImage,
      onError: (error, stackTrace) {
        setState(() {
          _hasError = true;
        });
      },
      fit: BoxFit.cover,
    );
  }
}
