import 'package:flutter/material.dart';
import 'package:yyets/models/help.dart';
import 'package:yyets/widgets/help_list_tile.dart';

class HelpListView extends StatelessWidget {
  final List<Help> helps;

  const HelpListView({Key key, this.helps}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        separatorBuilder: (context, index) => Divider(
              height: 1.0,
              indent: 0.0,
            ),
        itemCount: helps.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: HelpListTile(
              help: helps[index],
            ),
          );
        },
      ),
    );
  }
}
