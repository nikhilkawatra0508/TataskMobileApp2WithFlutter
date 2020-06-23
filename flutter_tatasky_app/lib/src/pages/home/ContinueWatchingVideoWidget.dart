
import 'package:fluttertataskyapp/src/provider/GlobalProvider.dart';
import 'package:flutter/material.dart';

import 'package:fluttertataskyapp/Widget/myWidgets.dart';
import 'package:fluttertataskyapp/src/Model/entity.dart';
import 'package:fluttertataskyapp/src/pages/MoviesListPage.dart';

import 'package:provider/provider.dart';



class ContinueWatchingVideoWidget extends StatelessWidget {
 

  final String title;
  const ContinueWatchingVideoWidget({Key key, this.title = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Consumer<GlobalProvider>(
        builder: (context, globalProvider, _) {
          return globalProvider.continueMovies.length == 0 ? Container() : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
               MyWidgets.heading(context, title, onTap: (){
               
                           Navigator.push(
                   context,
                      MaterialPageRoute(
                       builder: (_) => MoviesListPage(
                        this.title ,null,  loadedMovie: globalProvider.continueMovies, sharedPrefenceMovieID: "cont", isShowClearButton: true,
                       )));
                      
              }),
              SizedBox(height: 10,),
              Container(
                height: 150.0,
                child: listView(globalProvider.continueMovies,)
                  
              ),
            ],
          );
        }
      ),
    );
  }

  listView(List<MovieEntity> movies) => ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          var movie= movies[index];
          return MyWidgets.squareMovieDetail(movie, context, isWithPlayAndIdicator: true);
        },
      );


  
}
