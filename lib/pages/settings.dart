import 'package:flutter/material.dart';

class SettingRow {
  final String title;
  final String subtitle;
  final bool arrow;

  SettingRow({this.title, this.subtitle, this.arrow = false});
}

class SettingsPage extends StatelessWidget {
  final List<SettingRow> items = [
    SettingRow(title: "昵称", subtitle: "Popeye Lau", arrow: true),
    SettingRow(title: "更改密码", subtitle: null, arrow: true),
    SettingRow(title: "意见反馈", subtitle: null, arrow: true),
    SettingRow(title: "版本信息", subtitle: "V2.5.2", arrow: false),
    SettingRow(title: "加入人人影视字幕组", subtitle: null, arrow: true),
    SettingRow(title: "官方微博", subtitle: null, arrow: true),
    SettingRow(title: "官方微信", subtitle: "美剧炸了/USTVBOOM", arrow: false),
    SettingRow(title: "官方邮箱", subtitle: "fanyi@yyets.com", arrow: false),
    SettingRow(title: "官方网站", subtitle: null, arrow: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "设置",
      )),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(item.title),
                      ),
                      Row(
                        children: <Widget>[
                          item.subtitle == null
                              ? Container()
                              : Text(item.subtitle),
                          item.arrow
                              ? Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.grey,
                                )
                              : Container()
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: items.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: Text(
                  "退出",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
