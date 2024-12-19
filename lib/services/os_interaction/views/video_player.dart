import 'dart:io';
// import 'package:cobiz/app/start/shared/style.dart';
import 'package:flutter/material.dart';
// import 'package:play/play.dart';

class VideoPlayer extends StatelessWidget {
  final File? file;
  final String? url;
  const VideoPlayer({super.key, this.file, this.url});

  @override
  Widget build(BuildContext context) {
    return Container();

    // Video(
    //   mediaData: file != null
    //       ? MediaData.file(
    //           file: File(file!.path),
    //         )
    //       : MediaData.network(url: url!),
    //   fit: BoxFit.none,
    //   isAutoStart: true,
    //   builder: (BuildContext context, Widget child, Video video,
    //       VideoState videoState, MediaController mediaController) {
    //     return child;
    //   },
    //   onProcces: (BuildContext context) {
    //     return Container(
    //       height: 40,
    //       width: 40,
    //       decoration: BoxDecoration(
    //         color: Theme.of(context).cardColor,
    //         shape: BoxShape.circle,
    //       ),
    //       padding: const EdgeInsets.all(8),
    //       child: CircularProgressIndicator(
    //         strokeWidth: 2,
    //         color: APPSTYLE.BLACK_COLOR,
    //       ),
    //     );
    //   },
    // );
  }
}
