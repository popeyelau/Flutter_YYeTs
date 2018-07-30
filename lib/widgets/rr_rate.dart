import 'package:flutter/material.dart';

class RRRate extends StatelessWidget {
  final String score;

  const RRRate({Key key, this.score}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5.0), topLeft: Radius.circular(5.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "人人评分",
            style: TextStyle(fontSize: 12.0),
          ),
          Text(
            score,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          )
        ],
      ),
    );
  }
}
