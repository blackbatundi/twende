class UploadFilePath {
  String? urlUpload;
  String? url;
  String? fileName;
  String? filePath;
  UploadFilePath({this.urlUpload, this.url, this.fileName});

  UploadFilePath.fromJson(Map<String, dynamic> json) {
    urlUpload = json['url_upload'];
    url = json['url'];
    fileName = json['file_name'];
    filePath = json['file_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['url_upload'] = urlUpload;
    data['url'] = url;
    data['file_name'] = fileName;
    data['file_path'] = filePath;
    return data;
  }
}
