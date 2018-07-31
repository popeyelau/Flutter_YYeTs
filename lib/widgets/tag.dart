import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String text;
  final Color backgroudColor;
  final Color color;
  final bool border;

  const Tag(
      {Key key,
      this.text,
      this.color = Colors.black,
      this.backgroudColor,
      this.border = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 120.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        decoration: BoxDecoration(
            color: backgroudColor,
            borderRadius: BorderRadius.circular(20.0),
            border: border ? Border.all(color: color) : null),
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10.0, color: color),
        ),
      ),
    );
  }
}
