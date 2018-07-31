import 'package:yyets/models/profile.dart';
import 'package:yyets/redux/actions/main.dart';

class UpdateUserProfile extends ActionType {
  final Profile payload;
  UpdateUserProfile({this.payload}) : super(payload: payload);
}
