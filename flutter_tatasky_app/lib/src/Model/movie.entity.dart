import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'image.entity.dart';

class MovieEntity {
  String id;
  String title;
  String categories;
  String typeMovie;
  String year;
  String description = '';
  String country;
  String time;
  String trailer;
  List<ImageEntity> screenShots;
  ImageEntity screenShot;
  DateTime createdIn;
  DateTime modifiedIn;

  MovieEntity(
      {this.id,
      this.title = '',
      this.categories,
      this.year,
      this.description = '',
      this.time,
      this.country,
      this.trailer,
      this.typeMovie,
      this.screenShot,
      this.screenShots,
      this.createdIn,
      this.modifiedIn});

  MovieEntity.fromSnapshotJson(DocumentSnapshot snapshot)
      : this.id = snapshot.documentID,
        this.title = snapshot.data["Title"],
        this.trailer = snapshot.data["Trailer"],
        this.description = snapshot.data["Description"] ?? '',
        this.typeMovie = snapshot.data["TypeMovie"],
        this.categories = snapshot.data["Categories"],
        this.year = snapshot.data["Year"],
        this.country = snapshot.data["Country"],
        this.screenShot = ImageEntity.fromMap(snapshot['ScreenShot']),
        this.screenShots =
            snapshot.data["ScreenShots"].map<ImageEntity>((item) {
          return ImageEntity.fromMap(item);
        }).toList(),
        this.createdIn = snapshot.data['CreatedIn'].toDate(),
        this.modifiedIn = snapshot.data['ModifiedIn'].toDate();

  static Map<String, dynamic> stringToMap(String s) {
    Map<String, dynamic> map = json.decode(s);
    return map;
  }


  MovieEntity.fromJson(dynamic snapshot)
      : this.id = snapshot["ID"],
        this.title = snapshot["Title"],
        this.trailer = snapshot["Trailer"],
        this.description = snapshot["Description"] ?? '',
        this.typeMovie = snapshot["TypeMovie"],
        this.categories = snapshot["Categories"],
        this.year = snapshot["Year"],
        this.country = snapshot["Country"],
        this.screenShot = ImageEntity.fromMap(snapshot['ScreenShot']),
        this.screenShots =
            snapshot["ScreenShots"].map<ImageEntity>((item) {
          return ImageEntity.fromMap(item);
        }).toList();
       


  

  dynamic myEncode(dynamic item) {
  if(item is DateTime) {
    return item.toIso8601String();
  }
  return item;
}

  toJson() {
    return {
      "Id": this.id,
      "Title": this.title,
      "Categories": this.categories,
      "Trailer": this.trailer,
      "Description": this.description,
      "Year": this.year,
      "TypeMovie": this.typeMovie,
      'ScreenShot':
          this.screenShot == null ? ImageEntity() : this.screenShot.toJson(),
      "Country": this.country,
      "ScreenShots": this.screenShots == null
          ? List<ImageEntity>()
          : this.screenShots.map((i) => i.toJson()).toList(),
      "CreatedIn": jsonEncode((this.createdIn == null ? DateTime.now() : this.createdIn).toIso8601String()),
      "ModifiedIn": jsonEncode((this.createdIn == null ? DateTime.now() : this.createdIn).toIso8601String()),
    };
  }
}

class MovieEntityList{



  List<MovieEntity> movieEntityList;
  MovieEntityList.fromJSON(dynamic json)
    :
      movieEntityList = json == null ? List<MovieEntity>() :  (json as List).map((json) => MovieEntity.fromJson(json)).toList();  
}



class MovieCategory{
 String archive;
 String description;
 int categorystylesid;
 String imagePath;
 String name;
 int sid;
 String isfixed;
 MovieCategory(
{
this.archive, this.categorystylesid,this.description, this.imagePath, this.isfixed, this.name, this.sid
}
 );

MovieCategory.fromSnapshotJson(DocumentSnapshot snapshot)
:
this.sid=snapshot.data["SID"],
this.archive=snapshot.data["Archive"],
this.categorystylesid=snapshot.data["CategoryShowStyleSID"],
this.description=snapshot.data["Description"],
this.imagePath=snapshot.data["ImageUrl"],
this.name=snapshot.data["Name"],
this.isfixed=snapshot.data["IsFixed"];


//
 toJson() {
    return {
     "SID":this.sid,
     "Archive":this.archive,
     "CategoryShowStyleSID":this.categorystylesid,
     "Description":this.description,
     "ImageUrl":this.imagePath,
     "Name":this.name,
     "IsFixed":this.isfixed
    };
  }
}
