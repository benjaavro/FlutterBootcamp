import 'package:flutter/material.dart';
import '../constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.col, this.cardChild, this.onPress});

  final Color col;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: col,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}