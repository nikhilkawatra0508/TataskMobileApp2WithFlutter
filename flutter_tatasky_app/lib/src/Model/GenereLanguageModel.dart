import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class GenreLanguageAndActionModel{
 String languagetitle;
 String languagesubtitle;
 String genresubtitle;
 String iconpath;
 IconData genreIcon;
GenreLanguageAndActionModel({this.languagetitle='',this.languagesubtitle='',this.genreIcon, this.genresubtitle='', this.iconpath});
}


List<GenreLanguageAndActionModel>genreLanguageAndActionModel=[
GenreLanguageAndActionModel(languagetitle: "English",languagesubtitle: "English",genresubtitle: "Action"),
GenreLanguageAndActionModel(languagetitle: "हिन्दी",languagesubtitle: "Hindi",genresubtitle: "Drama"),
GenreLanguageAndActionModel(languagetitle: "தமிழ்",languagesubtitle: "Tamil",genresubtitle: "Comedy"),
GenreLanguageAndActionModel(languagetitle: "తెలుగు",languagesubtitle: "Telugu",genresubtitle: "Crime"),
GenreLanguageAndActionModel(languagetitle: "ਪੰਜਾਬੀ",languagesubtitle: "Punjabi",genresubtitle: "Horror"),
GenreLanguageAndActionModel(languagetitle: "ગુજરાતી",languagesubtitle: "Gujarati",genresubtitle: "Romance"),
GenreLanguageAndActionModel(languagetitle: "मराठी",languagesubtitle: "Mrathi",genresubtitle: "Thriller"),
GenreLanguageAndActionModel(languagetitle: "ಕನ್ನಡ",languagesubtitle: "Kannada",genresubtitle: "Kids"),
GenreLanguageAndActionModel(languagetitle: "മലയാളം",languagesubtitle: "Malayalam",genresubtitle: "Fantasy"),
GenreLanguageAndActionModel(languagetitle: "বাংলা",languagesubtitle: "Bengali",genresubtitle: "Family"),
];