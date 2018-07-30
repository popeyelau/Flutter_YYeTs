import 'package:flutter/material.dart';

class ActionBar extends StatelessWidget {
  final String likes;
  final String comments;
  final Function onComment;
  final Function onLike;
  final bool liked;

  const ActionBar(
      {Key key,
      this.likes,
      this.comments,
      this.onComment,
      this.onLike,
      this.liked = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: onComment,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.comment,
                    color: Colors.grey[400],
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(comments,
                      style: TextStyle(
                        color: Colors.grey[400],
                      )),
                ],
              ),
            ),
            Container(
              width: 1.0,
              height: 30.0,
              padding: EdgeInsets.symmetric(vertical: 4.0),
              color: Colors.grey[200],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.thumb_up,
                  color: liked ? Colors.red : Colors.grey[400],
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(likes,
                    style: TextStyle(
                      color: Colors.grey[400],
                    )),
              ],
            ),
          ]),
    );
  }
}
