import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedVariables
{
  static dynamic getString(key) async{
     SharedPreferences preferences = await SharedPreferences.getInstance();
     return preferences.get(key);

  }


  static Future<bool> getBool(key) async {
    SharedPreferences preferences =  await SharedPreferences.getInstance();
    return preferences.getBool(key);
  }

  static Future<bool> setBool(String key, bool value) async {
    SharedPreferences preferences =  await SharedPreferences.getInstance();
    return preferences.setBool(key, value);
  }


  static Future<bool> setString(String key, String value) async {
    SharedPreferences preferences =  await SharedPreferences.getInstance();
    return preferences.setString(key, value);
  }

  static Future<bool> setObject(String key, Object value) async {
    SharedPreferences preferences =  await SharedPreferences.getInstance();

     var stringValue = jsonEncode(value);
    return preferences.setString(key, stringValue);
  }


  static Future<bool> remove(String key) async {
    SharedPreferences preferences =  await SharedPreferences.getInstance();
    return preferences.remove(key);
  }



}


class MyHttpResponse<T>
{
  T data;



}