import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  final String title;

  const EmptyView({Key key, this.title = "No data."}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 240.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.local_movies,
              color: Colors.grey[300],
              size: 64.0,
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[400], fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
