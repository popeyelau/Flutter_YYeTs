import 'package:flutter/material.dart';
import 'package:yyets/models/enums.dart';
import 'package:yyets/widgets/gradient_tag.dart';

class UserInfoTile extends StatelessWidget {
  final UserLevel level;
  final List<Widget> trailing;
  final String avatar;
  final String nickName;
  final String groupName;
  final String time;

  const UserInfoTile(
      {Key key,
      this.level,
      this.avatar,
      this.time = "未知",
      this.nickName = "匿名",
      this.trailing,
      this.groupName = "至尊会员"})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isVip = level == UserLevel.superVip;
    final List<Color> colors = isVip
        ? [Colors.orange, Colors.red]
        : [Colors.blue, Colors.lightBlue.withAlpha(100)];
    List<Widget> children = [
      CircleAvatar(
        backgroundImage: NetworkImage(avatar),
      ),
      SizedBox(
        width: 8.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(nickName),
          Text(
            time,
            style: Theme.of(context).textTheme.body2,
          )
        ],
      ),
      SizedBox(
        width: 8.0,
      ),
      GradientTag(
          title: groupName,
          color: Colors.white,
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: colors))
    ];

    if (trailing != null) {
      children.add(Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: trailing,
        ),
      ));
    }

    return Container(
      child: Row(
        children: children,
      ),
    );
  }
}
