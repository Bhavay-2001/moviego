import 'package:moviego/constants.dart';

import 'networking.dart';

class MovieModel {
  
  Future<dynamic> getTopRatedMovies() async {
    NetworkHelper networkHelper = NetworkHelper('https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey');
    var movieData = await networkHelper.getMovieData();
    return movieData;
  }

  Future getGenreMovies(String url) async {
    NetworkHelper networkHelper = NetworkHelper('url');
    var movieData = await networkHelper.getMovieData();
    return movieData;
  }
}