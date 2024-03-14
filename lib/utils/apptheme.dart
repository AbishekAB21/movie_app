import 'package:flutter/material.dart';

AppTheme apptheme = AppDefaultTheme();

abstract class AppTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color terinaryColor;
  final TextStyle AppBarTitle;

  AppTheme({
    required this.primaryColor, 
    required this.secondaryColor,
    required this.terinaryColor,
    required this.AppBarTitle,
  
  });
}

class AppDefaultTheme extends AppTheme {
  AppDefaultTheme()
      : super(
        primaryColor: Colors.white, 
        secondaryColor: Colors.black,
        terinaryColor: Colors.grey.shade800,
        AppBarTitle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        
      );
}
