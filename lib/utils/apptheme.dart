import 'package:flutter/material.dart';

AppTheme apptheme = AppDefaultTheme();

abstract class AppTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color iconColor1;
  final Color bottomNavBarIconsColor;
  final Color terinaryColor;
  final TextStyle AppBarTitle;
  final TextStyle bottomNavBarLabel;

  AppTheme({
    required this.primaryColor, 
    required this.secondaryColor,
    required this.iconColor1,
    required this.bottomNavBarIconsColor,
    required this.terinaryColor,
    required this.AppBarTitle,
    required this.bottomNavBarLabel,
  
  });
}

class AppDefaultTheme extends AppTheme {
  AppDefaultTheme()
      : super(
        primaryColor: Colors.white, 
        secondaryColor: Colors.black,
        iconColor1: Colors.grey.shade600,
        bottomNavBarIconsColor: Colors.white,
        terinaryColor: Colors.grey.shade800,
        AppBarTitle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        bottomNavBarLabel: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
        
      );
}
