import 'package:flutter/material.dart';
import '../constants.dart';

class SexIconsWidget extends StatelessWidget {
  SexIconsWidget({@required this.sex, @required this.title});

  final IconData sex;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          sex,
          size: 50.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          title,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}