import 'package:flutter/material.dart';
import 'package:yyets/widgets/section_title.dart';

class Sort {
  final String key;
  final String text;

  Sort({this.key, this.text});

  static List<Sort> defaults = [
    Sort(key: "itemupdate", text: "按更新时间"),
    Sort(key: "views", text: "按发布日期"),
    Sort(key: "rank", text: "按排名"),
    Sort(key: "score", text: "按评分"),
    Sort(key: "dateline", text: "按点击率"),
  ];
}

class SortBar extends StatefulWidget {
  final Function onUpdate;

  const SortBar({Key key, this.onUpdate}) : super(key: key);
  @override
  SortBarState createState() {
    return new SortBarState();
  }
}

class SortBarState extends State<SortBar> {
  Sort sort = Sort.defaults.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PopupMenuButton(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          SectionTitle(
            title: sort.text,
          ),
          Icon(Icons.sort_by_alpha)
        ]),
        onSelected: (Sort v) {
          setState(() {
            sort = v;
          });
          widget.onUpdate(v);
        },
        itemBuilder: (BuildContext context) {
          return Sort.defaults
              .map((v) => PopupMenuItem(
                    key: Key(v.key),
                    value: v,
                    child: Text(v.text),
                  ))
              .toList();
        },
      ),
    );
  }
}
