

import 'package:fluttertataskyapp/Widget/myWidgets.dart';

import 'package:flutter/material.dart';


import 'SignupPage.dart';
import 'loginPage.dart';

class LoginAndSignUpPage extends StatefulWidget {
  @override
  _LoginAndSignUpPageState createState() => _LoginAndSignUpPageState();
}

class _LoginAndSignUpPageState extends State<LoginAndSignUpPage> with TickerProviderStateMixin  {
   gotoLogin() {
     print("calling");  
    _controller.animateToPage(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeIn,
    );
  }

  gotoSignup() {
    
    _controller.animateToPage(
      2,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeIn,
    );
  }

  PageController _controller =  PageController(initialPage: 1, viewportFraction: 1.0);
  
  Widget homePage({bool istataskybingUI=true}) {
    return Material(
      
      child:  Container(
        height: MediaQuery.of(context).size.height,
      color:Color(0xff1f2227),
        child:  Column(
          children: <Widget>[
            Container(
             
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height / 4.3),
              child: Hero(
                  tag: 'tatasky',
                child: Center(
                 child: Image.asset("assets/images/tatskybinge1.png" ,),
                ),
              ),
            ),
           
             Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 200.0),
              
              child:  MyWidgets.roundedOutlineButonWithSingleColor("SIGN UP", color: Color(0xff55e9fa) , onTap: ()=>gotoSignup(),),
           
             ),
             Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              child:  MyWidgets.roundedButonWithSingleColor("Login", onTap: ()
              {
                gotoLogin();
              } )
            ),
         
        
         ],
        ),
      ),
    );
 
 
  }
  @override
  Widget build(BuildContext context) {
 return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,

            child: PageView(
              controller: _controller,
              physics: new AlwaysScrollableScrollPhysics(),
              children: <Widget>[
                homePage(),LogInPage(), SignupPage() ,
              ],
              scrollDirection: Axis.horizontal,
            )),
      ),
    );
  }
}


