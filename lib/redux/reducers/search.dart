import 'package:yyets/redux/actions/main.dart';
import 'package:yyets/redux/actions/search.dart';
import 'package:yyets/redux/states/search.dart';

SearchState reducer(SearchState state, ActionType action) {
  if (action is UpdateHotKeywords) {
    return state.copyWith(keywords: action.payload);
  }
  if (action is UpdateSearchResults) {
    return state.copyWith(results: action.payload);
  }
  return state;
}
