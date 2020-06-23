// import 'package:cloud_firestore/cloud_firestore.dart';

class ImageEntity {
  ImageEntity({this.url = ''});

  String url;

  ImageEntity.fromMap(Map<dynamic, dynamic> data) : url = data["Url"];

  toJson() {
    return {"Url": this.url};
  }
}
