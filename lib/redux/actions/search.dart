import 'package:yyets/models/keyword.dart';
import 'package:yyets/models/lib_resource.dart';
import 'package:yyets/redux/actions/main.dart';

class UpdateHotKeywords extends ActionType {
  String get type => ReduxActions.updateHotKeywords;
  final List<Keyword> payload;
  UpdateHotKeywords({this.payload});
}

class UpdateSearchResults extends ActionType {
  String get type => ReduxActions.updateSearchResults;
  final List<LibResource> payload;
  UpdateSearchResults({this.payload});
}