import 'package:flutter/material.dart';
import 'package:movie_app/utils/apptheme.dart';

class LiveTV extends StatelessWidget {
  const LiveTV({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: apptheme.secondaryColor,
      body: Center(
        child: Text("Live TV Screen",style: apptheme.bottomNavBarLabel,),
      ),
    );
  }
}