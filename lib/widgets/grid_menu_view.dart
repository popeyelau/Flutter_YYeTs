import 'package:flutter/material.dart';
import 'package:yyets/models/main.dart';
import 'package:yyets/widgets/grid_menu_item.dart';

class GridMenuView extends StatelessWidget {
  final Function callback;

  GridMenuView({Key key, this.callback}) : super(key: key);

  final List<Menu> menus = [
    Menu(title: "电影", icon: "电影", channel: "movie"),
    Menu(title: "美剧", icon: "美剧", channel: "tv", area: "美国"),
    Menu(title: "英剧", icon: "英剧", channel: "tv", area: "英国"),
    Menu(title: "日剧", icon: "日剧", channel: "tv", area: "日本"),
    Menu(title: "韩剧", icon: "韩剧", channel: "tv", area: "韩国"),
    Menu(title: "其他语种", icon: "其他语种", channel: "tv"),
    Menu(title: "公开课", icon: "公开课", channel: "openclass"),
    Menu(title: "纪录片", icon: "纪录片", channel: "documentary"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        GridView.builder(
          itemCount: menus.length,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final border = BorderSide(color: Colors.grey[200]);
            return Container(
                decoration: BoxDecoration(
                    border: BorderDirectional(
                        top: border,
                        start: border,
                        end: (index % 4) == 3 ? border : BorderSide.none)),
                child: GridMenuItem(
                  menu: menus[index],
                  callback: callback,
                ));
          },
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        ),
        Container(
          height: 1.0,
          color: Colors.grey[200],
        )
      ],
    ));
  }
}
