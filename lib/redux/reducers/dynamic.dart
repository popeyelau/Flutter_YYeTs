import 'package:yyets/redux/actions/dynamic.dart';
import 'package:yyets/redux/actions/main.dart';
import 'package:yyets/redux/states/dynamic.dart';

DynamicState reducer(DynamicState state, ActionType action) {
  if (action is UpdateComments) {
    return state.copyWith(comments: action.payload);
  }
  if (action is UpdateHelps) {
    return state.copyWith(helps: action.payload, isLoading: false);
  }
  if (action is UpdateVideoInfo) {
    return state.copyWith(videoInfo: action.payload, isLoading: false);
  }
  if (action is UpdateVideoComments) {
    return state.copyWith(videoComments: action.payload);
  }
  return state;
}
