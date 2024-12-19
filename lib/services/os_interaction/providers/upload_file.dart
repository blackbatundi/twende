import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:twende/services/dio/api_url.dart';
import 'package:twende/services/dio/dio_service.dart';
import 'package:twende/services/dio/interceptors.dart';
import 'package:twende/services/os_interaction/models/upload_file_path.dart';
import 'package:mime/mime.dart';

class UploadFile {
  UploadFilePath? uploadFilePath;
  ValueNotifier<String?> errorMessage = ValueNotifier(null);
  ValueNotifier<double> progressPercent = ValueNotifier(.0);
  bool startCount = false;
  late final Dio dio = createDio();

  Dio createDio() {
    Dio dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30000), // for 30 seconds
        receiveTimeout: const Duration(seconds: 36000000),
        sendTimeout: const Duration(seconds: 36000000),
      ),
    );
    dio.interceptors.add(ApiInterceptor(dio));
    return dio;
  }

  bool hasUploaded = false;
  uploadFile(
    File? file,
  ) async {
    try {
      Uint8List image = File(file!.path).readAsBytesSync();
      Options options = Options(
        contentType: lookupMimeType(file.path),
        headers: {
          'Accept': "*/*",
          'Content-Length': image.length,
          'Connection': 'keep-alive',
          'User-Agent': 'Upperz'
        },
      );

      await dio.put(
        uploadFilePath!.url!,
        data: Stream.fromIterable(
          image.map((e) => [e]),
        ),
        options: options,
        onSendProgress: (int progress, int total) {
          if (startCount) {
            if (progress > 1) {
              progressPercent.value = (progress * 100) / total;
            }
            if (progressPercent.value == 100) hasUploaded = true;
          }
        },
      );
    } catch (e) {
      hasUploaded = false;
      errorMessage.value = e.toString();
    }
  }

  getUploadFilePath(Map<String, dynamic> data) async {
    try {
      var response = await httpPostWithToken(
        endPoint: APIURL.UPLOAD,
        data: data,
      );
      uploadFilePath = UploadFilePath.fromJson(response.data['data']);
    } on Exception catch (e) {
      errorMessage.value = e.toString();
    }
  }
}
