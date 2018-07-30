import 'package:yyets/redux/actions/main.dart';
import 'package:yyets/redux/states/main.dart';
import 'package:yyets/redux/states/search.dart';

SearchState reducer(ReduxState state, ActionType action) {
  final SearchState search = state.search;

  switch (action.type) {
    case ReduxActions.updateHotKeywords:
      return search.copyWith(keywords: action.payload);
        case ReduxActions.updateSearchResults:
      return search.copyWith(results: action.payload);
    default:
      return search;
  }
}
