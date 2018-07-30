import 'package:flutter/foundation.dart';
import 'package:yyets/redux/states/dynamic.dart';
import 'package:yyets/redux/states/home.dart';
import 'package:yyets/redux/states/lib.dart';
import 'package:yyets/redux/states/profile.dart';
import 'package:yyets/redux/states/rank.dart';
import 'package:yyets/redux/states/search.dart';

@immutable
class ReduxState {
  final HomeState home;
  final RankState rank;
  final LibState lib;
  final SearchState search;
  final DynamicState dynamics;
  final ProfileState profile;

  const ReduxState(
      {this.home,
      this.rank,
      this.lib,
      this.search,
      this.dynamics,
      this.profile});
}
