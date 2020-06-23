
import 'package:bloc_pattern/bloc_pattern.dart';

import 'package:fluttertataskyapp/Widget/theme_provider.dart';
import 'package:fluttertataskyapp/src/pages/home/Appwidget.dart';
import 'package:fluttertataskyapp/src/pages/home/TopWidget.dart';
import 'package:fluttertataskyapp/src/pages/home/VerticalmovieWidget.dart';
import 'package:fluttertataskyapp/src/provider/bloc/MovieBloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ContinueWatchingVideoWidget.dart';
import 'GenereAndLanguaageWidget.dart';

class DiscoveryHomePage extends StatefulWidget {
  @override
  _DiscoveryHomePageState createState() => _DiscoveryHomePageState();
}
MovieBloc _movieBloc = BlocProvider.getBloc<MovieBloc>();
class _DiscoveryHomePageState extends State<DiscoveryHomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
var _darkTheme = true;

  double _height;
  double _width;
  @override
  void initState() {
  
    super.initState();
  }
    
 void onThemeChanged(bool value, ThemeProvider themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(AppTheme.darkTheme)
        : themeNotifier.setTheme(AppTheme.lightTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
   
    
     final themeNotifier = Provider.of<ThemeProvider>(context);
    
    _darkTheme = (themeNotifier.getTheme() == AppTheme.darkTheme);
    return Scaffold(
    //  backgroundColor:Color(0xff1f2227),
      key: scaffoldKey,
      drawer: Drawer(
        child: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: <Widget>[
            Opacity(
              opacity: 0.75,
              child: Container(
                height: _height / 6,
                padding: EdgeInsets.only(top: _height / 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange[200], Colors.pinkAccent],
                  ),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.person,
                      size: 40,
                     
                    ),
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                  title: Text("Ashish"),
                  subtitle: Text("",style: TextStyle(fontSize: 13),),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                     color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.payment, color: Theme.of(context).iconTheme.color,),
              title: Text("Redeem Vouchers"),
            ),
            ListTile(
              leading: Icon(Icons.favorite_border,color: Theme.of(context).iconTheme.color,),
              title: Text("Favorites"),
            ),
            ListTile(
              leading: Icon(Icons.watch_later,color: Theme.of(context).iconTheme.color,),
              title: Text("Watchlist"),
            ),
            Divider(),
             ListTile(
              leading: Icon(Icons.watch_later,color: Theme.of(context).iconTheme.color,),
              title: Text("Watchlist"),
            ),
             ListTile(
            title: Text('Dark Theme'),
            contentPadding: const EdgeInsets.only(left: 16.0),
            trailing: Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          value: _darkTheme,
                          onChanged: (bool value) {
                            setState(() {
                              _darkTheme = value;
                            });
                             onThemeChanged(value, themeNotifier);
                          },
                        ),
                      )
            ),
          ],
        ),
      ),
  
      ),
      bottomNavigationBar: bottomnavigationbar(),
      body: Container(
        height: _height,
        width: _width,
          // color: Color(0xff1f2227),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // top carusel and menu 
              topWidgetMain(),
              
              ContinueWatchingVideoWidget(),
              SizedBox(height:5.0),
                VerticalMovieWidge(
              title: 'Show We Love', listMovieFlux: _movieBloc.listMoviesPopularFlux),
              SizedBox(height:15.0),
              GenereAndLanguageWidget(title: 'Browse by Language',),
              SizedBox(height:15.0),
               GenereAndLanguageWidget(title: 'Browse by Genere',),
               SizedBox(height:15.0),
                VerticalMovieWidge(
              title: 'Binge Watch : Bear Grylls', listMovieFlux: _movieBloc.listMoviesMyListFlux),
              SizedBox(height:20)
              
            ],
          ),
        ),
      ),
    );
  }

// top crosel and menu
  Widget topWidgetMain() {
    return Stack(
      children: <Widget>[
        Container(
          height: _height / 1.9,
          decoration: BoxDecoration(
             gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent,  Theme.of(context).backgroundColor])
         
          ),
          child:TopWidget()
        ),
       
       
       
        Container(
          height: 120,
          decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Theme.of(context).backgroundColor]),
                      
                        ),
          margin: EdgeInsets.only( top: _height / 2.05),
          child: AppWidget(  title: '',)
        
        ),
        Container(
          //color: Colors.blue,
            margin: EdgeInsets.only(left: 20, right: 20, top: _height / 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: GestureDetector(
                      onTap: () {
                        scaffoldKey.currentState.openDrawer();
                      },
                      child:IconTheme(
                        data: IconThemeData(
                          color:Colors.white
                        ),
                        child: Icon(Icons.menu, size:30, color:Colors.white,)),)
                ),
              
                Flexible(
                  child: Container(
                    height: _height / 17,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20,right: 10),
                 
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset("assets/images/tatskybinge1.png", )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: (){},
                      child: IconTheme(
                        data: IconThemeData(
                          color:Colors.white
                        ),
                        child: Icon(Icons.search, color: Colors.white,size: _height/20,))),
                  
              ],
            )),


      ],
    );
  }

Widget bottomnavigationbar(){
 return  Theme(
   data: Theme.of(context).copyWith(
             
              textTheme: Theme.of(context)
                  .textTheme
 ),
   child: BottomNavigationBar(
          //currentIndex: _cIndex,
          backgroundColor:Theme.of(context).backgroundColor,
          selectedLabelStyle:  TextStyle( color:Theme.of(context).accentColor),
          selectedIconTheme: IconThemeData(
            color:Theme.of(context).accentColor
          ),
          unselectedIconTheme: IconThemeData(
            color:Theme.of(context).iconTheme.color
          ),
         // unselectedLabelStyle: TextStyle( color:Theme.of(context).bottomAppBarColor),
          showUnselectedLabels: true,
         
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              title: new Text('Home')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard,),
              title: new Text('Explore',)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subject,),
              title: new Text('MindBlown')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.picture_in_picture,),
              title: new Text('Premium')
            )
          ],
          
        ),
 ) ;
}

 
}