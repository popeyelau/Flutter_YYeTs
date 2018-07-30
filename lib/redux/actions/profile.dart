import 'package:yyets/models/profile.dart';
import 'package:yyets/redux/actions/main.dart';

class UpdateUserProfile extends ActionType {
  String get type => ReduxActions.updateUserProfile;
  final Profile payload;
  UpdateUserProfile({this.payload});
}
