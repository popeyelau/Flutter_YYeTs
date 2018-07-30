import 'package:yyets/models/article_comment.dart';
import 'package:yyets/redux/actions/main.dart';

class UpdateArticleComments extends ActionType {
  String get type => ReduxActions.updateArticleComments;
  final List<ArticleComment> payload;
  UpdateArticleComments({this.payload});
}
