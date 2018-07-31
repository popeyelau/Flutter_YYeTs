import 'package:yyets/models/resource.dart';
import 'package:yyets/redux/actions/main.dart';

class UpdateTopRanks extends ActionType {
  final Ranks payload;
  UpdateTopRanks({this.payload}) : super(payload: payload);
}
