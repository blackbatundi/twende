import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:twende/services/os_interaction/models/upload_file_path.dart';
import 'package:twende/services/os_interaction/providers/upload_file.dart';

class UpladController {
  /// the plage of values are 1 and 0
  /// if 0, that means the upload of both audio and the trimmed audio file has been successfuly uploaded
  /// if 1, that means the trimmed audio has been successfuly uploaded but not the audi
  /// for the video we will have until the 2 part
  int audioUploadProgress = 0;

  /// while the upload is stopping on the step 1, we will be
  /// in need of this filepath to continue the next upload
  MediaUpload mediaUpload = MediaUpload();
  Future<UploadFilePath?> uploadFile({
    required UploadFile uploadFile,
    required File file,
  }) async {
    uploadFile.progressPercent.value = .0;
    uploadFile.errorMessage.value = null;
    uploadFile.hasUploaded = false;
    uploadFile.startCount = true;
    Map<String, dynamic> data = {
      "extension": p.extension(file.path).substring(1),
    };
    await uploadFile.getUploadFilePath(data);
    // if we get an error we stop the function excution
    // we don't put nothing in the curly bracet because the same instance
    // is used in the screen and from there we can show the error message

    if (uploadFile.errorMessage.value != null) return null;
    await uploadFile.uploadFile(file);
    return uploadFile.uploadFilePath;
  }

  Future<MediaUpload?> uploadAudioFile(
      {required File media,
      required File trimedMedia,
      required UploadFile uploadFile,
      required int mediaSize,
      required int mediaDuration,
      required String type,
      required String apiType}) async {
    Map<String, dynamic> data = {};
    if (audioUploadProgress == 0) {
      /// we first upload the trimmed audio file to the aws and get the store the
      /// uploaded trimmed audio file inside the [AudioUpload] trimmedAudioPath's variable

      data = {
        "extension": p.extension(trimedMedia.path).substring(1),
        "type": type,
      };
      await uploadFile.getUploadFilePath(data);

      if (uploadFile.errorMessage.value != null) return null;

      await uploadFile.uploadFile(trimedMedia);
      mediaUpload.trimmedMediaPath = uploadFile.uploadFilePath;
    }

    /// if everything passed okay, we can now pass to the second part of the
    /// upload, the audio file upload
    uploadFile.startCount = true;
    data['extension'] = p.extension(media.path).substring(1);
    data['type'] = type;
    data['file_name'] = mediaUpload.trimmedMediaPath?.fileName;
    await uploadFile.getUploadFilePath(data);

    if (uploadFile.errorMessage.value != null) {
      audioUploadProgress = 1;
      return null;
    }
    await uploadFile.uploadFile(media);
    if (uploadFile.errorMessage.value != null) {
      audioUploadProgress = 1;
      return null;
    }
    mediaUpload.mediaPath = uploadFile.uploadFilePath;
    mediaUpload.mediaSize = mediaSize;
    mediaUpload.type = apiType;
    mediaUpload.mediaDuration = mediaDuration;
    return mediaUpload;
  }
}

class MediaUpload {
  String? type;
  UploadFilePath? thimnail;
  UploadFilePath? trimmedMediaPath;
  UploadFilePath? mediaPath;
  int? mediaSize; // in megaByte
  int? mediaDuration; // in second
}
