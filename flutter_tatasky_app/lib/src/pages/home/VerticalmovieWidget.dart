
import 'package:fluttertataskyapp/Widget/DiscoveryWidget.dart';
import 'package:flutter/material.dart';

import 'package:fluttertataskyapp/Widget/myWidgets.dart';
import 'package:fluttertataskyapp/src/Model/entity.dart';

import '../MoviesListPage.dart';


class VerticalMovieWidge extends StatelessWidget {
  final Stream<List<MovieEntity>> listMovieFlux;

  final String title;
 

  const VerticalMovieWidge({Key key, this.listMovieFlux, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          MyWidgets.heading(context, title, onTap: (){
          Navigator.push(
               context,
                  MaterialPageRoute(
                   builder: (_) => MoviesListPage(
                    this.title ,this.listMovieFlux
                   )));
          }),
          
          Container(
            height: 110.0,
            margin: EdgeInsets.only(top:20),
            child: StreamBuilder(
                initialData: List<MovieEntity>(),
                stream: listMovieFlux,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) return Container(height: 1, width: 1);

                  List<MovieEntity> movies = snapshot.data;
                  return DiscoveryWidget. moviehorizental(movies);
                }),
          ),
        ],
      ),
    );
  }

}