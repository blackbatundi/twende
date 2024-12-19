import 'dart:io';

import 'package:file_picker/file_picker.dart';

List<String> allowedFileExtention = [
  "pdf",
];

bool isVideo(String url) {
  return url.contains("videos");
}

Future<List<File>?> pickFile(bool isMultiple,
    {required FileType fileType, String? type}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: isMultiple,
  );

  if (result != null) {
    List<File> files = [];
    for (String? filePath in result.paths) {
      files.add(File(filePath!));
    }
    return files;
  }
  return null;
}
