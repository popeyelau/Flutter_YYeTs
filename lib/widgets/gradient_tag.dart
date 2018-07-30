import 'package:flutter/material.dart';

class GradientTag extends StatelessWidget {
  final Color color;
  final String title;
  final Gradient gradient;

  const GradientTag({Key key, this.color, this.title, this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), gradient: gradient),
      child: Text(
        title,
        style: TextStyle(color: color, fontSize: 10.0),
      ),
    );
  }
}
