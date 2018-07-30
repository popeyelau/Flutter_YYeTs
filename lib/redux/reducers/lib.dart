import 'package:yyets/redux/actions/main.dart';
import 'package:yyets/redux/states/lib.dart';
import 'package:yyets/redux/states/main.dart';

LibState reducer(ReduxState state, ActionType action) {
  final LibState lib = state.lib;

  switch (action.type) {
    case ReduxActions.updateLibResources:
      return lib.copyWith(resources: action.payload, isLoading: false);
    case ReduxActions.updateFiltedResources:
      return lib.copyWith(filtedResources: action.payload);
    case ReduxActions.updateResourceCategory:
      return lib.copyWith(category: action.payload);
    default:
      return lib;
  }
}
