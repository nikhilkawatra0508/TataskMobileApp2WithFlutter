import 'dart:convert';

import 'package:fluttertataskyapp/Helper/SharedVariables.dart';
import 'package:fluttertataskyapp/src/Model/movie.entity.dart';

class GlobalHelper {
  static Future<List<MovieEntity>> geMovies(String key) async {
    var dataString = await SharedVariables.getString(key);

    if (dataString == null) {
      return List<MovieEntity>();
    }
    var jsonData = jsonDecode(dataString);
    var data = MovieEntityList.fromJSON(jsonData);
    return data.movieEntityList;
  }

  static Future<bool> addMovies(String key, MovieEntity movieEntity) async {
    var exitingMovieEntityList = await geMovies(key);
    exitingMovieEntityList.removeWhere(
        (data) => data.title == movieEntity.title); //remove existy list if have

    exitingMovieEntityList.insert(0, movieEntity); // inser in first index

    var isAdded = await SharedVariables.setObject(
        key, exitingMovieEntityList.map((e) => e.toJson()).toList());

    return isAdded;
  }

  static Future<bool> removeMovies(String key) async {
    var isRemoved = await SharedVariables.remove(key);

    return isRemoved;
  }
}
