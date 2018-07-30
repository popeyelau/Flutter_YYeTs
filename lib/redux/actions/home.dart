import 'package:yyets/models/ad.dart';
import 'package:yyets/models/article.dart';
import 'package:yyets/models/tv_schedule.dart';
import 'package:yyets/redux/actions/main.dart';

class UpdateTVSchedule extends ActionType {
  String get type => ReduxActions.updateTVSchedule;
  final List<TVSchedule> payload;
  UpdateTVSchedule({this.payload});
}

class UpdateArticles extends ActionType {
  String get type => ReduxActions.updateArticles;
  final List<Article> payload;
  UpdateArticles({this.payload});
}

class UpdateAds extends ActionType {
  String get type => ReduxActions.updateAds;
  final List<Ad> payload;
  UpdateAds({this.payload});
}
