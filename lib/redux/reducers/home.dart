import 'package:yyets/redux/actions/main.dart';
import 'package:yyets/redux/states/home.dart';
import 'package:yyets/redux/states/main.dart';

HomeState reducer(ReduxState state, ActionType action) {
  final HomeState home = state.home;

  switch (action.type) {
    case ReduxActions.updateTVSchedule:
      return home.copyWith(schedules: action.payload);
    case ReduxActions.updateArticles:
      return home.copyWith(articles: action.payload, isLoading: false);
    case ReduxActions.updateAds:
      return home.copyWith(ads: action.payload);
    default:
      return home;
  }
}
