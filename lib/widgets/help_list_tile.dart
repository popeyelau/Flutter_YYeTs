import 'package:flutter/material.dart';
import 'package:yyets/models/enums.dart';
import 'package:yyets/models/help.dart';
import 'package:yyets/widgets/main.dart';

class HelpListTile extends StatelessWidget {
  final Help help;

  const HelpListTile({Key key, this.help}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> trailing;
    if (help.resourceCnname != null) {
      trailing = [
        Tag(
          text: help.resourceCnname,
          color: Colors.blue,
          border: true,
        )
      ];
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UserInfoTile(
            level: UserLevel.superVip,
            nickName: help.nickname,
            avatar: help.userpic,
            groupName: help.groupName,
            time: help.dateline,
            trailing: trailing,
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            help.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              help.detail,
              style: TextStyle(height: 1.2, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
