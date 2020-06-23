
import 'package:fluttertataskyapp/src/Model/entity.dart';
import 'package:fluttertataskyapp/src/pages/details/DetailMoviePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'myWidgets.dart';

class DiscoveryWidget{
  static Widget moviehorizental(List<MovieEntity> movies){
 return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          var movie= movies[index];
         // return MyWidgets.squareMovieDetail(movie, context);
         return InkWell(
           onTap: (){
              Navigator.push(
               context,
                MaterialPageRoute(
                 builder: (_) => DetailsMoviePage(
                  movie:movie 
                 )));
           },
           child: Container(
             width: 200,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
             child: MyWidgets.catcheNetworkImage(movie.screenShot.url),
             //  MyWidgets.catcheNetworkImage(movie.screenShot.url, height:115.0),
           ),
         );
        },
      );
}


// static  Widget drawer( context) {
//     double _height=MediaQuery.of(context).size.height;
//     var _darkTheme = true;
//      final themeNotifier = Provider.of<ThemeProvider>(context);
//     _darkTheme = (themeNotifier.getTheme() == darkTheme);
//     return Drawer(
//       child: Container(
//         color: Color(0xff1f2227),
//         child: Column(
//           children: <Widget>[
//             Opacity(
//               opacity: 0.75,
//               child: Container(
//                 height: _height / 6,
//                 padding: EdgeInsets.only(top: _height / 20),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.orange[200], Colors.pinkAccent],
//                   ),
//                 ),
//                 child: ListTile(
//                   leading: CircleAvatar(
//                     child: Icon(
//                       Icons.person,
//                       size: 40,
//                       color: Colors.black,
//                     ),
//                     radius: 30,
//                     backgroundColor: Colors.white,
//                   ),
//                   title: Text("Ashish"),
//                   subtitle: Text("",style: TextStyle(fontSize: 13),),
//                   trailing: Icon(
//                     Icons.arrow_forward_ios,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.payment),
//               title: Text("Redeem Vouchers"),
//             ),
//             ListTile(
//               leading: Icon(Icons.favorite_border),
//               title: Text("Favorites"),
//             ),
//             ListTile(
//               leading: Icon(Icons.watch_later),
//               title: Text("Watchlist"),
//             ),
//             Divider(),
//              ListTile(
//               leading: Icon(Icons.watch_later),
//               title: Text("Watchlist"),
//             ),
//              ListTile(
//             title: Text('Dark Theme'),
//             contentPadding: const EdgeInsets.only(left: 16.0),
//             trailing: Transform.scale(
//                         scale: 0.8,
//                         child: CupertinoSwitch(
//                           value: _darkTheme,
//                           onChanged: (bool value) {
//                             setState(() {
//                               _darkTheme = value;
//                             });
//                              onThemeChanged(value, themeNotifier);
//                           },
//                         ),
//                       )
//             ),
//           ],
//         ),
//       ),
  
//     );


  }

  



