import 'package:fluttertataskyapp/Helper/GlobalHelper.dart';
import 'package:fluttertataskyapp/src/provider/GlobalProvider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertataskyapp/Widget/appTheme.dart';
import 'package:fluttertataskyapp/Widget/myWidgets.dart';
import 'package:fluttertataskyapp/src/Model/entity.dart';
import 'package:provider/provider.dart';

import 'details/DetailMoviePage.dart';

class MoviesListPage extends StatefulWidget {
final Stream<List<MovieEntity>> listMovieFlux;
 List<MovieEntity> loadedMovie;
final bool isShowClearButton ;
String sharedPrefenceMovieID;

  final String title;
  MoviesListPage(this.title,this.listMovieFlux, {this.loadedMovie, this.isShowClearButton =  false, this.sharedPrefenceMovieID = "cont"});
  @override
  _MoviesListPageState createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: AppTheme.background,
        title:Text(widget.title), 
        actions: <Widget>[
          Visibility(
            visible: widget.isShowClearButton,
            child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async{
                    await GlobalHelper.removeMovies(widget.sharedPrefenceMovieID);
                 
                    setState(() {
                      widget.loadedMovie = List<MovieEntity>();
                    });

                     Provider.of<GlobalProvider>(context, listen: false).setContinueMovie();
                }),
          ),
        ],
      ),
      body: Container(
        child: widget.loadedMovie == null ? StreamBuilder(
                initialData: List<MovieEntity>(),
                stream: widget.listMovieFlux,
                builder: (BuildContext context, AsyncSnapshot<List<MovieEntity>> snapshot) {
                  if (!snapshot.hasData || snapshot.data.length == 0) return Center(child: CircularProgressIndicator()); 

                  List<MovieEntity> movies = snapshot.data;
                  return getGridView(movies);
                }) : getGridView(widget.loadedMovie),
        
      ),
    );
  }

  getGridView(List<MovieEntity> movies){
return movies.length ==0 ? Container(child: Center(child: Text("No Movies Added in " + widget.title),),) : GridView.count(
  crossAxisCount: 2,
   childAspectRatio: 0.70,
        children:movies.map(
        (movie) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                 Navigator.push(
                 context,
                  MaterialPageRoute(
                   builder: (_) => DetailsMoviePage(
                    movie: movie,
                   )));
              },
              //child:MyWidgets.catcheNetworkImage(movie.screenShot.url, height:0.0),
              child: Column(
               
                children: <Widget>[
                 
                    MyWidgets.catcheNetworkImage(movie.screenShot.url, height:150.0),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromRGBO(43, 45, 65, 0.5),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text(movie.title, style: TextStyle(color:Colors.grey[200]),),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: SizedBox(
                              height: 20.0,
                               child: Image.asset('assets/images/netfliex.png')),
                           )
                         ]
                      )
                    )
                  
                ],
              ),
              // child: Container(
               
              //   child: Image.network(
              //       movie.screenShot.url,
              //       fit: BoxFit.cover,
                  
              //   ),
              // ),
            ),
          );
        },
      ).toList(),
          
         
        );
  }
}