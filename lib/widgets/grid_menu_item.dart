import 'package:flutter/material.dart';
import 'package:yyets/models/main.dart';

class GridMenuItem extends StatelessWidget {
  final Menu menu;
  final Function callback;
  const GridMenuItem({Key key, this.menu, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          callback(menu);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.asset("assets/images/${menu.icon}.png",width: 30.0, height: 30.0,),
            ),
            Expanded(
              flex: 1,
              child: Text(
                menu.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.body2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
