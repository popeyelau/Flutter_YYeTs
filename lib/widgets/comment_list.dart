import 'package:flutter/material.dart';
import 'package:yyets/models/video_comment.dart';
import 'package:yyets/widgets/comment_listtile.dart';

class CommentList extends StatelessWidget {
  final List<VideoComment> comments;

  const CommentList({Key key, this.comments}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => Divider(
            height: 1.0,
            indent: 0.0,
          ),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final item = comments[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: CommentListTile(
              avatar: item.userpic,
              nickName: item.nickname,
              dateline: item.dateline,
              groupName: item.groupName,
              content: item.content,
            ),
            onTap: () {

            },
          ),
        );
      },
    );
  }
}
