import 'package:flutter/material.dart';
import 'package:movie_app/utils/apptheme.dart';
import 'package:movie_app/utils/text.dart';

class TV extends StatelessWidget {
  final List populartv;
  const TV({super.key, required this.populartv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedTexts(
            text: "Popular TV Shows",
            size: 22,
            color: apptheme.primaryColor,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 190,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: populartv.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          populartv[index]['backdrop_path']),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: modifiedTexts(
                              text: populartv[index]['original_name'] != null
                                  ? populartv[index]['original_name']
                                  : 'Loading',
                              color: apptheme.primaryColor,
                              size: 15),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
