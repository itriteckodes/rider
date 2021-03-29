import 'dart:convert';
import 'dart:io';

class Photo {
  Photo(String path) {
    this.path = path;
    this.base64String = base64Encode(File(path).readAsBytesSync());
  }

  String base64String;
  String path;
}
