
import 'package:fluttertataskyapp/src/pages/SubscriptionActiveAppPage.dart';
import 'package:fluttertataskyapp/src/pages/home/DashBoardHomePage.dart';
import 'package:flutter/material.dart';
import 'Login/LoginAndSignUpPage.dart';

final routes = {
  '/login': (BuildContext context) =>  LoginAndSignUpPage(),
   '/home': (BuildContext context) =>  DashBoardHomePage(),
     '/subscribe': (BuildContext context) =>  SubscriptionActiveAppPage(),
   '/homeBinge': (BuildContext context) =>  DashBoardHomePage(istoptataskybing: true,),
};