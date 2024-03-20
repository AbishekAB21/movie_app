import 'package:flutter/material.dart';
import 'package:movie_app/utils/apptheme.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: apptheme.secondaryColor,
      body: Center(
        child: Text("Download Screen",style: apptheme.bottomNavBarLabel,),
      ),
    );
  }
}