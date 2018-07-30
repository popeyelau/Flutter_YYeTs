import 'package:yyets/redux/actions/main.dart';
import 'package:yyets/redux/states/main.dart';
import 'package:yyets/redux/states/profile.dart';

ProfileState reducer(ReduxState state, ActionType action) {
  final ProfileState profile = state.profile;

  switch (action.type) {
    case ReduxActions.updateUserProfile:
      return profile.copyWith(profile: action.payload);
    default:
      return profile;
  }
}
