import 'package:yyets/models/comment.dart';
import 'package:yyets/models/help.dart';
import 'package:yyets/models/video_comment.dart';
import 'package:yyets/models/video_info.dart';
import 'package:yyets/redux/actions/main.dart';

class UpdateComments extends ActionType {
  final List<Comment> payload;
  UpdateComments({this.payload}) : super(payload: payload);
}

class UpdateHelps extends ActionType {
  final List<Help> payload;
  UpdateHelps({this.payload}) : super(payload: payload);
}

class UpdateVideoInfo extends ActionType {
  final VideoInfo payload;
  UpdateVideoInfo({this.payload}) : super(payload: payload);
}

class UpdateVideoComments extends ActionType {
  final List<VideoComment> payload;
  UpdateVideoComments({this.payload}) : super(payload: payload);
}
