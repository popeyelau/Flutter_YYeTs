import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yyets/pages/tab_page.dart';
import 'package:yyets/redux/states/main.dart';
import 'package:yyets/redux/view_models/main.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  final Store<ReduxState> store = StoreContainer.global;
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<ReduxState> store;
  MyApp({this.store});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<ReduxState>(
        store: store,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Colors.black,
              textTheme: TextTheme(
                  body1: TextStyle(fontSize: 15.0, color: Colors.black87),
                  body2: TextStyle(fontSize: 13.0, color: Colors.grey),
                  caption: TextStyle(fontSize: 10.0, color: Colors.grey),
                  display1: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold))),
          home: TabPage(),
        ));
  }
}
