import 'package:flutter/material.dart';

class IconLabel extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;

  const IconLabel({Key key, this.icon, this.color = Colors.grey, this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: color,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            title,
            style: TextStyle(color: color),
          )
        ],
      ),
    );
  }
}
