import 'package:yyets/redux/actions/lib.dart';
import 'package:yyets/redux/actions/main.dart';
import 'package:yyets/redux/states/lib.dart';

LibState reducer(LibState state, ActionType action) {
  if (action is UpdateLibResources) {
    return state.copyWith(resources: action.payload, isLoading: false);
  }
  if (action is UpdateFiltedResources) {
    return state.copyWith(filtedResources: action.payload);
  }
  if (action is UpdateResourceCategory) {
    return state.copyWith(category: action.payload);
  }
  return state;
}
