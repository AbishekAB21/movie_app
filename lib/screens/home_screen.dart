import 'package:flutter/material.dart';
import 'package:movie_app/utils/apptheme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              SizedBox(width: 10,),
              Text("Filmeum", style: apptheme.AppBarTitle,),
            ],
          ),
          centerTitle: true,
          backgroundColor: apptheme.terinaryColor,
        ),
        body: CustomScrollView(),
      ),
    );
  }
}