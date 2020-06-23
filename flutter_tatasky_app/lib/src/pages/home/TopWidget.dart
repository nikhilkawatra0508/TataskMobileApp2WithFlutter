import 'package:bloc_pattern/bloc_pattern.dart';

import 'package:flutter/material.dart';

import 'package:fluttertataskyapp/Widget/myWidgets.dart';
import 'package:fluttertataskyapp/src/Model/entity.dart';
import 'package:fluttertataskyapp/src/pages/details/DetailMoviePage.dart';

import 'package:fluttertataskyapp/src/provider/bloc/MovieBloc.dart';
import 'package:carousel_pro/carousel_pro.dart';



class TopWidget extends StatefulWidget {

  @override
  _TopWidgetState createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  MovieBloc _movieBloc = BlocProvider.getBloc<MovieBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
      
       
        width: double.infinity,
        child: StreamBuilder(
            initialData: List<MovieEntity>(),
            stream: _movieBloc.listMoviesFlux,
            builder: (BuildContext context, AsyncSnapshot<List<MovieEntity>> snapshot) {
              if (!snapshot.hasData || snapshot.data.length == 0) return Center(child:CircularProgressIndicator(
             valueColor: new AlwaysStoppedAnimation<Color>(Colors.redAccent),
              ));
                return Container(
                  child: Carousel(
                    dotSize: 7.0,
                    dotColor: Colors.white54,
                    dotIncreaseSize: 1.2,
                    dotBgColor: Colors.transparent,
                    dotPosition: DotPosition.bottomCenter,
                    images:snapshot.data.map(
        (movie) {
          return InkWell(
            onTap: () {
            
                  Navigator.push(
               context,
                MaterialPageRoute(
                 builder: (_) => DetailsMoviePage(
                   movie:movie
                 )));
              
              
              
            },
          child:Hero(
            tag:movie.title,
            child:
             MyWidgets.catcheNetworkImage(movie.screenShot.url,),
          ),
            
          );
        },
      ).toList(),
                  ),
                );
             
            })
            );
  }
}




