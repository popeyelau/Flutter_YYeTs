import 'package:yyets/redux/actions/main.dart';
import 'package:yyets/redux/actions/rank.dart';
import 'package:yyets/redux/states/rank.dart';

RankState reducer(RankState state, ActionType action) {
  if (action is UpdateTopRanks) {
    return state.copyWith(ranks: action.payload, isLoading: false);
  }
  return state;
}
