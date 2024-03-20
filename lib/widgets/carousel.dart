import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MovieCarousel extends StatelessWidget {
  final List images;
  const MovieCarousel({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: images.map((e) {
          return Builder(builder: (context) {
            return Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
           decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(image: NetworkImage('https://image.tmdb.org/t/p/w500${e['backdrop_path']}'))
           ),
          );
          },);
        }).toList(), 
        options: CarouselOptions(
          height: 200,
          autoPlay: true
        )),
    );
  }
}