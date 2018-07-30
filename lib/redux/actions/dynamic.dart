import 'package:yyets/models/comment.dart';
import 'package:yyets/models/help.dart';
import 'package:yyets/models/video_comment.dart';
import 'package:yyets/models/video_info.dart';
import 'package:yyets/redux/actions/main.dart';

class UpdateComments extends ActionType {
  String get type => ReduxActions.updateComments;
  final List<Comment> payload;
  UpdateComments({this.payload});
}

class UpdateHelps extends ActionType {
  String get type => ReduxActions.updateHelps;
  final List<Help> payload;
  UpdateHelps({this.payload});
}

class UpdateVideoInfo extends ActionType {
  String get type => ReduxActions.updateVideoInfo;
  final VideoInfo payload;
  UpdateVideoInfo({this.payload});
}

class UpdateVideoComments extends ActionType {
  String get type => ReduxActions.updateVideoComments;
  final List<VideoComment> payload;
  UpdateVideoComments({this.payload});
}
