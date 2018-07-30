import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yyets/pages/settings.dart';
import 'package:yyets/redux/states/main.dart';
import 'package:yyets/redux/view_models/profile.dart';
import 'package:yyets/widgets/gradient_tag.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ReduxState, ProfileViewModel>(
        converter: (store) => ProfileViewModel(store),
        builder: (context, vm) {
          return Drawer(
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/drawer_bg.jpeg"),
                  )),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(vm.profile.userpic ??
                        "http://popeyelau.qiniudn.com/popeye.png"),
                  ),
                  accountEmail: Text(vm.profile.email ?? "popeyelau@gmail.com"),
                  accountName: Row(
                    children: <Widget>[
                      Text(vm.profile.nickname ?? "Popeye"),
                      SizedBox(
                        width: 8.0,
                      ),
                      GradientTag(
                        title: vm.profile.groupName ?? "至尊会员",
                        gradient:
                            LinearGradient(colors: [Colors.orange, Colors.red]),
                      )
                    ],
                  ),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).pop(),
                  leading: Icon(
                    Icons.comment,
                    color: Colors.orangeAccent,
                  ),
                  title: Text("我的评论"),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).pop(),
                  leading: Icon(
                    Icons.star,
                    color: Colors.redAccent,
                  ),
                  title: Text("我的收藏"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SettingsPage()));
                  },
                  leading: Icon(
                    Icons.settings,
                    color: Colors.blue,
                  ),
                  title: Text("设置"),
                ),
                ListTile(
                  onTap: () => Navigator.of(context).pop(),
                  leading: Icon(
                    Icons.help,
                    color: Colors.purple,
                  ),
                  title: Text("帮助"),
                ),
              ],
            ),
          );
        });
  }
}
