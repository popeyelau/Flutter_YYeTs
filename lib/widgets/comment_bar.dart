import 'package:flutter/material.dart';

class CommentBar extends StatelessWidget {
  final String replayName;

  const CommentBar({Key key, this.replayName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              style: TextStyle(height: 0.8, color: Colors.black),
              decoration: InputDecoration(
                hintText: "回复: $replayName",
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          RaisedButton(
            color: Colors.blue,
            child: Text(
              "回复",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
