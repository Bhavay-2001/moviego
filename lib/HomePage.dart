import 'package:flutter/material.dart';
import 'package:moviego/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'movie.dart';
import 'SliderCard.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'GenreOptionBox.dart';
import 'constants.dart';
import 'ListOfMovies.dart';
import 'HomeContainer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieModel movieModel = MovieModel();
  List<dynamic> movies = [];
  List<dynamic> genreMovies = [];
  String selectedGenre = "Drama";

  List<String> genres = ['Drama', 'Thriller', 'Action', 'Comedy', 'Horror', 'Mystery'];
  var selectedGenreInNumber = {
    "Action" : 28,
    "Comedy" : 35,
    "Drama" : 18,
    "Thriller" : 53,
    "Horror" : 27,
    "Mystery" : 9648,
  };
  int selectedGenreIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTopRatedMoviesData();
    getGenreMovieData(selectedGenre);
  }

  Future<dynamic> getMovieData() async {
    http.Response response = await http
        .get('https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey');
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  void getTopRatedMoviesData() async {
    var movieData = await getMovieData();
    setState(() {
      movies = movieData['results'];
    });
    print(movies);
  }

  Future getGenreMovieDataWhole(String genreNumber) async {
    http.Response response = await http.get("https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=$genreNumber");
    if(response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      var result = decodedData['results'];
      return result;
    }else{
      print(response.statusCode);
    }
  }

  void getGenreMovieData(String genreNumber) async {
    var movieData = await getGenreMovieDataWhole(genreNumber);
    setState(() {
      genreMovies = movieData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieGO'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFE11A38)),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'MovieGO',
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'About Page',
                style: TextStyle(fontSize: 18.0),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.black54,
            padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 10.0),
            child: Text(
              'Top Rated',
              style: kTopRatedTextStyle,
            ),
          ),
          Expanded(
            child: CarouselSlider.builder(
              itemCount: movies == null ? 0 : movies.length,
              options: CarouselOptions(
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                scrollDirection: Axis.horizontal,
              ),
              itemBuilder: (BuildContext context, int itemIndex) => Container(
                child: SliderCard(movies: movies, i: itemIndex),
                padding: EdgeInsets.all(12.0),
                color: Colors.black54,
              ),
            ),
          ),
          Container(
            color: Colors.black54,
            padding: EdgeInsets.only(
              left: 15.0,
              top: 10.0,
              bottom: 10.0,
            ),
            child: Text(
              'Suggested for you',
              style: kSuggestionTextStyle,
            ),
          ),
          Container(
            height: 70.0,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: genres.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                 GenreOptionBox(genre: genres,
                    onPress: () {
                   setState(() {
                     selectedGenre = genres[index];
                     selectedGenreIndex = index;
                     getGenreMovieData(selectedGenre);
                   });
                    },
                    color: selectedGenre == genres[index] ? kActiveColor : kInactiveColor,
                    index: index),
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: selectedGenreIndex,
              children: [
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(8.0),
                  itemCount: genreMovies==null ? 0:genreMovies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieList(movies: genreMovies, i: index);
                  },
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(8.0),
                  itemCount: genreMovies==null ? 0:genreMovies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieList(movies: genreMovies, i: index);
                  },
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(8.0),
                  itemCount: genreMovies==null ? 0:genreMovies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieList(movies: genreMovies, i: index);
                  },
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(8.0),
                  itemCount: genreMovies==null ? 0:genreMovies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieList(movies: genreMovies, i: index);
                  },
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(8.0),
                  itemCount: genreMovies==null ? 0:genreMovies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieList(movies: genreMovies, i: index);
                  },
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(8.0),
                  itemCount: genreMovies==null ? 0:genreMovies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieList(movies: genreMovies, i: index);
                  },
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 95.0,
            child: HomeContainer(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0) , topRight: Radius.circular(60.0)),
              color: kActiveColor,
            ),
          ),
        ],
      ),
    );
  }
}

// ListView.builder(
// scrollDirection: Axis.vertical,
// padding: EdgeInsets.all(8.0),
// itemCount: 10,
// itemBuilder: (BuildContext context, int index) {
// return MovieList(movies: genreMovies, i: index);
// },
// ),

// Row(
// children: [
// GenreOptionBox(
// genre: 'Drama',
// onPress: () {
// setState(() {
// selectedGenre = GenreType.drama;
// getGenreMovieData('https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=$selectedGenre');
// });
// },
// color: selectedGenre == GenreType.drama
// ? kActiveColor
//     : kInactiveColor,
// ),
// GenreOptionBox(
// genre: 'Action',
// onPress: () {
// setState(() {
// selectedGenre = GenreType.action;
// });
// },
// color: selectedGenre == GenreType.action
// ? kActiveColor
//     : kInactiveColor,
// ),
// GenreOptionBox(
// genre: 'Comedy',
// onPress: () {
// setState(() {
// selectedGenre = GenreType.comedy;
// });
// },
// color: selectedGenre == GenreType.comedy
// ? kActiveColor
//     : kInactiveColor,
// ),
// GenreOptionBox(
// genre: 'Fiction',
// onPress: () {
// setState(() {
// selectedGenre = GenreType.fiction;
// });
// },
// color: selectedGenre == GenreType.fiction
// ? kActiveColor
//     : kInactiveColor,
// ),
// GenreOptionBox(
// genre: 'Thriller',
// onPress: () {
// setState(() {
// selectedGenre = GenreType.thriller;
// });
// },
// color: selectedGenre == GenreType.thriller
// ? kActiveColor
//     : kInactiveColor,
// ),
// ],
// ),