import 'package:flutter/material.dart';

class GenreOptionBox extends StatelessWidget {
  final List genre;
  final int index;
  final Function onPress;
  final Color color;
  GenreOptionBox({@required this.genre, @required this.onPress, @required this.color, this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(13.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: color,
          ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            genre[index],
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
        ),
      ),
    );
  }
}
