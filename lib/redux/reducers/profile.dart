import 'package:yyets/redux/actions/main.dart';
import 'package:yyets/redux/actions/profile.dart';
import 'package:yyets/redux/states/profile.dart';

ProfileState reducer(ProfileState state, ActionType action) {
  if (action is UpdateUserProfile) {
    return state.copyWith(profile: action.payload);
  }
  return state;
}
