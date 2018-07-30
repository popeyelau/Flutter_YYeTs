import 'package:yyets/redux/states/main.dart';
import 'package:yyets/redux/reducers/home.dart' as home;
import 'package:yyets/redux/reducers/rank.dart' as rank;
import 'package:yyets/redux/reducers/lib.dart' as lib;
import 'package:yyets/redux/reducers/search.dart' as search;
import 'package:yyets/redux/reducers/dynamic.dart' as dynamics;
import 'package:yyets/redux/reducers/profile.dart' as profile;

ReduxState reduxReducer(ReduxState state, action) => ReduxState(
    home: home.reducer(state, action),
    rank: rank.reducer(state, action),
    lib: lib.reducer(state, action),
    search: search.reducer(state, action),
    dynamics: dynamics.reducer(state, action),
    profile: profile.reducer(state, action));
