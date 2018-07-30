import 'package:yyets/models/resource.dart';
import 'package:yyets/redux/actions/main.dart';

class UpdateTopRanks extends ActionType {
  String get type => ReduxActions.updateTopRanks;
  final Ranks payload;
  UpdateTopRanks({this.payload});
}
