import 'package:flutter/material.dart';
import 'package:movie_app/utils/apptheme.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: apptheme.secondaryColor,
      body: Center(
        child: Text("Store Screen",style: apptheme.bottomNavBarLabel,),
      ),
    );
  }
}