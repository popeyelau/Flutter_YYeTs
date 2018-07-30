import 'package:yyets/redux/actions/main.dart';
import 'package:yyets/redux/states/dynamic.dart';
import 'package:yyets/redux/states/main.dart';

DynamicState reducer(ReduxState state, ActionType action) {
  final DynamicState dynamics = state.dynamics;

  switch (action.type) {
    case ReduxActions.updateComments:
      return dynamics.copyWith(comments: action.payload);
    case ReduxActions.updateHelps:
      return dynamics.copyWith(helps: action.payload, isLoading: false);
    case ReduxActions.updateVideoInfo:
      return dynamics.copyWith(videoInfo: action.payload, isLoading: false);
    case ReduxActions.updateVideoComments:
      return dynamics.copyWith(videoComments: action.payload);
    default:
      return dynamics;
  }
}
