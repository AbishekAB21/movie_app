import 'package:flutter/material.dart';
import 'package:movie_app/functions/searchBar.dart';
import 'package:movie_app/utils/apptheme.dart';
import 'package:movie_app/widgets/carousel.dart';
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
   // print(tvTopRatedResults);
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
          backgroundColor: apptheme.secondaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/Prime_logo.png",
                width: 46,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.cast,
                  color: apptheme.iconColor1,
                )),
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/profile.png",
                  color: Colors.blue.shade600,
                  width: 30,
                )) 
          ],
        ),
        body: ListView(
          children: [
            SearchBarFunc(),
            MovieCarousel(images: tvTopRated),
            TV(populartv: tvTopRated),
            TopRatedMovies(toprated: topRatedMovies),
            TrendingMovies(trending: trendingmovies),
          ],
        ),
      ),
    );
  }
}
 