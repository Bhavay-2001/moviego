import 'package:flutter/material.dart';
import 'constants.dart';

class StarDisplay extends StatelessWidget {
  final double value;
  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}

class SliderCard extends StatelessWidget {
  final dynamic movies;
  final int i;
  SliderCard({this.movies, this.i});
  final String image_url = "https://image.tmdb.org/t/p/w500/";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 140.0,
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  image_url + movies[i]['poster_path'],
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10.0, top: 12.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movies[i]['title'],
                    maxLines: 2,
                    style: kTitleTextStyle,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Overview',
                    style: kOverviewTextStyle,
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    movies[i]['overview'],
                    maxLines: 4,
                    style: kOverviewDesciptionTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
