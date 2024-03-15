import 'package:flutter/material.dart';
import 'package:movie_app/utils/apptheme.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/popular_tv.dart';
import 'package:movie_app/widgets/top_rated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingmovies = [];
  List topRatedMovies = [];
  List tvTopRated = [];
  final String apiKey = '408c290ecdcf9f22cd27fe9c1edfd1af';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MDhjMjkwZWNkY2Y5ZjIyY2QyN2ZlOWMxZWRmZDFhZiIsInN1YiI6IjY1ZjI5OGJlZWVhMzRkMDE2NDE0MWE0NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AqhYcsnstaPRrq9_CpDqvSAprj_CI2g6t_At-zrJW6U';

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readaccesstoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedMoviesResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvTopRatedResults = await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trendingmovies = trendingResult['results'];
      topRatedMovies = topRatedMoviesResult['results'];
      tvTopRated = tvTopRatedResults['results'];
    });
    print(trendingmovies);
  }

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: apptheme.secondaryColor,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.movie),
              SizedBox(
                width: 10,
              ),
              modifiedTexts(
                text: "Filmeum",
                color: apptheme.primaryColor,
                size: 20,
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: apptheme.terinaryColor,
        ),
        body: ListView(
          children: [
            TV(populartv: tvTopRated),
            TopRatedMovies(toprated: topRatedMovies),
            TrendingMovies(trending: trendingmovies),
          ],
        ),
      ),
    );
  }
}
