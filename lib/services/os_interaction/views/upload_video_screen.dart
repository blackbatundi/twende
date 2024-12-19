import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:twende/services/extentions.dart';
import 'package:twende/services/os_interaction/providers/file_picker.dart';
import 'package:twende/services/os_interaction/providers/upload_file.dart';
import 'package:twende/services/os_interaction/views/video_player.dart';
import '../controllers/upoad_controller.dart';
import '../models/upload_file_path.dart';

class UploadVideoScreen extends StatefulWidget {
  final double? height;
  final double? width;
  final String? type;
  final Widget child;
  final double? radius;
  final Widget editWidget;
  final FileType fileType;
  final ValueChanged<UploadFilePath>? onFinished;
  const UploadVideoScreen({
    super.key,
    this.height,
    this.width,
    this.type,
    required this.child,
    this.radius,
    required this.editWidget,
    required this.onFinished,
    required this.fileType,
  });

  @override
  State<UploadVideoScreen> createState() => _UploadVideoScreenState();
}

class _UploadVideoScreenState extends State<UploadVideoScreen> {
  File? file;
  UpladController? upladController = UpladController();
  UploadFile uploadFile = UploadFile();
  bool hasfinished = false;
  bool hasStartUpload = false;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: uploadFile.errorMessage,
      builder: (context, String? errorMessage, child) {
        return ValueListenableBuilder(
          valueListenable: uploadFile.progressPercent,
          builder: (context, double uploadStatusPercent, child) {
            return file != null
                ? Stack(
                    children: [
                      Center(
                        child: VideoPlayer(
                          file: file!,
                        ),
                      ),
                      Positioned(
                          top: 30,
                          right: 20,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () async {
                                  var result = await pickFile(
                                    false,
                                    fileType: widget.fileType,
                                  );
                                  if (result != null) {
                                    setState(() {
                                      file = result[0];
                                    });
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .cardColor
                                        .withOpacity(.3),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Iconsax.edit,
                                  ),
                                ),
                              ),
                              10.widthBox,
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    hasStartUpload = true;
                                  });
                                  upladController!
                                      .uploadFile(
                                    uploadFile: uploadFile,
                                    file: file!,
                                  )
                                      .then((value) {
                                    if (value != null) {
                                      setState(() {
                                        hasfinished = true;
                                        hasStartUpload = false;
                                      });
                                      widget.onFinished?.call(value);
                                    }
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .cardColor
                                        .withOpacity(.3),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.file_upload_outlined,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      if (hasStartUpload &&
                          uploadStatusPercent < 100 &&
                          uploadStatusPercent > 0 &&
                          errorMessage == null)
                        Container(
                          height: widget.height,
                          width: widget.width,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).disabledColor.withOpacity(.7),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                widget.radius ?? 10,
                              ),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  const Positioned(
                                    top: 0,
                                    bottom: 0,
                                    right: 0,
                                    left: 0,
                                    child: Icon(
                                      Icons.stop_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 35,
                                    width: 35,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 4,
                                      color: Colors.white,
                                      value: uploadStatusPercent / 100,
                                    ),
                                  ),
                                ],
                              ),
                              5.heightBox,
                              Text(
                                "${uploadStatusPercent.toStringAsFixed(0)}%",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (hasStartUpload &&
                              (uploadStatusPercent == 0 &&
                                  errorMessage == null) ||
                          (uploadStatusPercent == 100 && !hasfinished))
                        Container(
                          height: widget.height,
                          width: widget.width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(widget.radius ?? 0),
                            color:
                                Theme.of(context).disabledColor.withOpacity(.5),
                          ),
                          child: const SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      if (errorMessage != null)
                        InkWell(
                          onTap: () async {
                            var result = await pickFile(false,
                                fileType: widget.fileType);
                            if (result != null) {
                              setState(() {
                                file = result[0];
                              });
                            }
                          },
                          child: Container(
                            height: widget.height,
                            width: widget.width,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(widget.radius ?? 0),
                              color: Theme.of(context)
                                  .disabledColor
                                  .withOpacity(.5),
                            ),
                            child: InkWell(
                              onTap: () {
                                upladController!
                                    .uploadFile(
                                  uploadFile: uploadFile,
                                  file: file!,
                                )
                                    .then((value) {
                                  if (value != null) {
                                    setState(() {
                                      hasfinished = true;
                                    });
                                    widget.onFinished?.call(value);
                                  }
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .error
                                      .withOpacity(.5),
                                ),
                                child: const Icon(
                                  Icons.refresh,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (hasStartUpload &&
                          uploadStatusPercent == 100 &&
                          errorMessage == null)
                        Positioned(
                          right: 10,
                          bottom: 10,
                          child: InkWell(
                            onTap: () async {
                              var result = await pickFile(
                                false,
                                fileType: widget.fileType,
                              );

                              if (result != null) {
                                setState(() {
                                  file = result[0];
                                });
                              }
                            },
                            child: widget.editWidget,
                          ),
                        ),
                    ],
                  )
                : InkWell(
                    onTap: () async {
                      var result =
                          await pickFile(false, fileType: widget.fileType);

                      if (result != null) {
                        setState(() {
                          file = result[0];
                        });
                      }
                    },
                    child: widget.child,
                  );
          },
        );
      },
    );
  }
}
