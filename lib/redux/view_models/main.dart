import 'package:redux/redux.dart';
import 'package:yyets/redux/states/dynamic.dart';
import 'package:yyets/redux/states/home.dart';
import 'package:yyets/redux/states/lib.dart';
import 'package:yyets/redux/states/main.dart';
import 'package:yyets/redux/reducers/main.dart';
import 'package:yyets/redux/states/profile.dart';
import 'package:yyets/redux/states/rank.dart';
import 'package:yyets/redux/states/search.dart';

abstract class ViewModel {
  final Store<ReduxState> store;
  ViewModel(this.store);
}

class StoreContainer {
  static final Store<ReduxState> global = reduxStore();
}

Store reduxStore() => Store<ReduxState>(reduxReducer,
    initialState: ReduxState(
        home: HomeState.initialState(),
        rank: RankState.initialState(),
        lib: LibState.initialState(),
        search: SearchState.initialState(),
        dynamics: DynamicState.initialState(),
        profile: ProfileState.initialState()));
