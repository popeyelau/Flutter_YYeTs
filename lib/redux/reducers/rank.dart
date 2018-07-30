import 'package:yyets/redux/actions/main.dart';
import 'package:yyets/redux/states/main.dart';
import 'package:yyets/redux/states/rank.dart';

RankState reducer(ReduxState state, ActionType action) {
  final RankState rank = state.rank;

  switch (action.type) {
    case ReduxActions.updateTopRanks:
      return rank.copyWith(ranks: action.payload, isLoading: false);
    default:
      return rank;
  }
}
