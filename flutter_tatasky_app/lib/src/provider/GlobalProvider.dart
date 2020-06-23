import 'package:fluttertataskyapp/Helper/GlobalHelper.dart';
import 'package:fluttertataskyapp/src/Model/movie.entity.dart';
import 'package:flutter/material.dart';

class GlobalProvider with ChangeNotifier
{

  List<MovieEntity> _continueMovies = List<MovieEntity>();
  
  List<MovieEntity>  get continueMovies => _continueMovies;
  void setContinueMovie() async{
   
   _continueMovies = await GlobalHelper.geMovies("cont");
    notifyListeners();
  }

}