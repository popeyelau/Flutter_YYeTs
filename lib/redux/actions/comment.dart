import 'package:yyets/models/article_comment.dart';
import 'package:yyets/redux/actions/main.dart';

class UpdateArticleComments extends ActionType {
  final List<ArticleComment> payload;
  UpdateArticleComments({this.payload}) : super(payload: payload);
}
