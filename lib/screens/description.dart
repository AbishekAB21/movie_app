import 'package:flutter/material.dart';
import 'package:movie_app/utils/apptheme.dart';
import 'package:movie_app/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, launch_date, bannerURL, posterURL, vote;

  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.launch_date,
      required this.bannerURL,
      required this.posterURL,
      required this.vote});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: apptheme.secondaryColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: apptheme.primaryColor),
          backgroundColor: apptheme.secondaryColor,
          title: Text(name, style: apptheme.AppBarTitle,),
          centerTitle: true,
        ),
        body: Container(
          child: ListView(
            children: [
              Container(
                child: Stack(
                  children: [
                    Positioned(
                        child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerURL,
                        fit: BoxFit.cover,
                      ),
                    )),
                    Positioned(
                        bottom: 10,
                        child: modifiedTexts(
                            text: ' ⭐ ' + vote,
                            color: apptheme.primaryColor,
                            size: 18))
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: modifiedTexts(
                    // ignore: unnecessary_null_comparison
                    text: name != null ? name : 'Not Loaded',
                    color: apptheme.primaryColor,
                    size: 26),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: modifiedTexts(
                    text: 'Release Date ' + launch_date,
                    color: apptheme.primaryColor,
                    size: 16),
              ),
              Row(
                children: [
                  Container(
                    height: 200,
                    width: 100,
                    margin: EdgeInsets.all(10),
                    child: Image.network(posterURL),
                  ),
                  Flexible(child: Container(child: modifiedTexts(text: description, color: apptheme.primaryColor, size: 14),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
