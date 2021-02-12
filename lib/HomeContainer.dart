import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.home,
          color: Colors.white,
          size: 30.0,
        ),
              // SizedBox(
              //   height: 2.0,
              // ),
              // Text(
              //   'HOME',
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 20.0,
              //   ),
              // ),

        Icon(
          Icons.favorite_border_rounded,
          color: Colors.white,
          size: 30.0,
        ),
        Icon(
          Icons.perm_identity,
          color: Colors.white,
          size: 30.0,
        )
      ],
    );
  }
}
