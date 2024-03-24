import 'package:flutter/material.dart';
import 'package:movie_app/functions/searchBar.dart';
import 'package:movie_app/utils/apptheme.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/rent_carousel.dart';
import 'package:movie_app/widgets/upcoming.dart';
import 'package:tmdb_api/tmdb_api.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  List trendingmovies = [];
  List upcomingmovies = [];

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
    Map upcomingMoviesResult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    setState(() {
      trendingmovies = trendingResult['results'];
      upcomingmovies = upcomingMoviesResult['results'];
    });
    print("\n\nupcoming");
    print(upcomingmovies);
  }

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: apptheme.secondaryColor,
        body: SafeArea(
          child: Scaffold(
            backgroundColor: apptheme.secondaryColor,
            appBar: AppBar(
              backgroundColor: apptheme.secondaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  modifiedTexts(
                      text: "Store",
                      color: apptheme.StoreAppBarTitle,
                      size: 20),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.cast,
                      color: apptheme.iconColor1,
                    )),
                Image.asset(
                  "assets/profile.png",
                  width: 30,
                  color: Colors.blue.shade600,
                )
              ],
            ),
            body: ListView(
              children: [
                SearchBarFunc(),
                RentMovies(rent: trendingmovies),
                SizedBox(
                  height: 10,
                ),
                UpcomingMovies(upcoming: upcomingmovies),
              ],
            ),
          ),
        ));
  }
}
