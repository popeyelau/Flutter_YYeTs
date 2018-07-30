import 'package:flutter/material.dart';
import 'package:yyets/models/comment.dart';
import 'package:yyets/models/enums.dart';
import 'package:yyets/pages/video.dart';
import 'package:yyets/widgets/icon_label.dart';
import 'package:yyets/widgets/resource_tile.dart';
import 'package:yyets/widgets/tag.dart';
import 'package:yyets/widgets/user_info_tile.dart';

class HotCommentListTile extends StatelessWidget {
  final Comment comment;
  const HotCommentListTile({Key key, this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UserInfoTile(
            level: UserLevel.superVip,
            nickName: comment.nickname,
            avatar: comment.userpic,
            groupName: comment.groupName,
            time: comment.dateline,
            trailing: [
              Tag(
                text: comment.channelCn,
                color: Theme.of(context).primaryColor,
                border: true,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(comment.content),
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconLabel(
                icon: Icons.comment,
                title: comment.replyNum,
              ),
              SizedBox(
                width: 50.0,
              ),
              IconLabel(
                icon: Icons.thumb_up,
                title: comment.good,
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          GestureDetector(
            child: ResourceTile(
              resource: comment.resourceInfo,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => VideoPage(
                        id: comment.resourceInfo.id,
                        poster: comment.resourceInfo.poster,
                        title: comment.resourceInfo.cnname,
                      )));
            },
          )
        ],
      ),
    );
  }
}
