import 'package:yyets/models/ad.dart';
import 'package:yyets/models/article.dart';
import 'package:yyets/models/tv_schedule.dart';
import 'package:yyets/redux/actions/main.dart';

class UpdateTVSchedule extends ActionType {
  final List<TVSchedule> payload;
  UpdateTVSchedule({this.payload}) : super(payload: payload);
}

class UpdateArticles extends ActionType {
  final List<Article> payload;
  UpdateArticles({this.payload}) : super(payload: payload);
}

class UpdateAds extends ActionType {
  final List<Ad> payload;
  UpdateAds({this.payload}) : super(payload: payload);
}
