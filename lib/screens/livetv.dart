import 'package:flutter/material.dart';
import 'package:movie_app/utils/apptheme.dart';

class LiveTV extends StatelessWidget {
  const LiveTV({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: apptheme.secondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Icon(
            Icons.signal_wifi_connected_no_internet_4_rounded,
            color: apptheme.iconColor1,
            size: 100,
          )),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            "You're currently offline !",
            style: apptheme.bottomNavBarLabel,
          )),
        ],
      ),
    );
  }
}
