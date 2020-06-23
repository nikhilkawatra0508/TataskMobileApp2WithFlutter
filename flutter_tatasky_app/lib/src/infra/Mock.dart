import 'package:fluttertataskyapp/src/Model/entity.dart';

import 'package:fluttertataskyapp/src/provider/service/MovieService.dart';

class Mock {


 static get generateMock async{


    MovieService db = MovieService();

    MovieEntity movie = MovieEntity(categories: 'Adventure',
        description: 'Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis.',
        typeMovie: 'Featured',title:'Aladim',trailer: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/aladim/aladim.mp4',country: 'USA',time : '150 min',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/aladim/principal.jpg'),screenShots:List<ImageEntity>(),year: '2019' );

    movie.screenShots.add(ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/aladim/screen1.jpg'));
    movie.screenShots.add(ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/aladim/screen2.jpg'));
    movie.screenShots.add(ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/aladim/screen3.jpg'));
    movie.screenShots.add(ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/aladim/screen4.jpg'));
    await db.save(movie);

    movie = MovieEntity(categories: 'Fantasy',typeMovie: 'Featured',title:'The Nutcracker',trailer: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/disney/trailer.mp4'
        ,description: 'Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis.',
        country: 'USA',time : '150 min',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/disney/principal.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    movie.screenShots.add(ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/disney/1.jpg'));
    movie.screenShots.add(ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/disney/2.jpg'));
    movie.screenShots.add(ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/disney/3.jpg'));
    await db.save(movie);


    movie = MovieEntity(categories: 'Terror',typeMovie: 'Featured',title:'IT 2',trailer: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/disney/trailer.mp4'
        ,country: 'USA',time : '150 min',description: 'Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis.',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/palhaco/principal.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    movie.screenShots.add(ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/palhaco/1.jpg'));
    movie.screenShots.add(ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/palhaco/2.jpg'));
    movie.screenShots.add(ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/palhaco/3.jpg'));
    movie.screenShots.add(ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/featured/palhaco/4.jpg'));
    await db.save(movie);

    movie = MovieEntity(categories: 'Terror',typeMovie: 'MyList',title:'MIB'
        ,country: 'USA',time : '120 min',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/mylist/1.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    await db.save(movie);

    movie = MovieEntity(categories: 'Terror',typeMovie: 'MyList',title:'Abigail'
        ,country: 'USA',time : '120 min',description: 'Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis.',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/mylist/2.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    await db.save(movie);

    movie = MovieEntity(categories: 'Fantasy',typeMovie: 'MyList',title:'Spride-Man'
        ,country: 'USA',time : '120 min',description: 'Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis.',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/mylist/3.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    await db.save(movie);

    movie = MovieEntity(categories: 'Terror',typeMovie: 'MyList',title:'Avengers'
        ,country: 'USA',time : '120 min',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/mylist/4.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    await db.save(movie);

    movie = MovieEntity(categories: 'Terror',typeMovie: 'MyList',title:'Angel Has  Fallen'
        ,country: 'USA',time : '120 min',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/mylist/5.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    await db.save(movie);


    movie = MovieEntity(categories: 'Terror',typeMovie: 'Popular',title:'GenMan'
        ,country: 'USA',time : '120 min',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/popular/1.jpg'),screenShots:List<ImageEntity>(),year: '2018' );
        
    await db.save(movie);

    movie = MovieEntity(categories: 'Terror',typeMovie: 'Popular',title:'Sonic'
        ,country: 'USA',time : '120 min',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/popular/2.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    await db.save(movie);

    movie = MovieEntity(categories: 'Fantasy',typeMovie: 'Popular',title:'Losing'
        ,country: 'USA',time : '120 min',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/popular/3.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    await db.save(movie);

    movie = MovieEntity(categories: 'Terror',typeMovie: 'Popular',title:'Kid King'
        ,country: 'USA',time : '120 min',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/popular/4.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    await db.save(movie);

    movie = MovieEntity(categories: 'Terror',typeMovie: 'Popular',title:'Angel Has  Fallen'
        ,country: 'USA',time : '120 min',
        screenShot: ImageEntity(url: 'https://stockflutter-youtube.s3.amazonaws.com/FlutterNetflixUIRedesign/popular/5.jpg'),screenShots:List<ImageEntity>(),year: '2018' );

    await db.save(movie);


  }
}