import 'package:flutter/material.dart';
import 'package:yyets/models/enums.dart';
import 'package:yyets/widgets/user_info_tile.dart';

class CommentListTile extends StatelessWidget {

  final String avatar;
  final String nickName;
  final String dateline;
  final String groupName;
  final String content;

  const CommentListTile({Key key, this.avatar, this.nickName, this.dateline, this.groupName, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 5.0,),
          UserInfoTile(
            level: UserLevel.superVip,
            avatar: avatar,
            nickName: nickName,
            time: dateline,
            groupName: groupName,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(content),
          )
        ],
      ),
    );
  }
}
