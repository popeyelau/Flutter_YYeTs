import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yyets/api/api.dart';
import 'package:yyets/redux/states/main.dart';
import 'package:yyets/redux/view_models/dynamic.dart';
import 'package:yyets/widgets/main.dart';

class DynamicPage extends StatefulWidget {
  @override
  _DynamicPageState createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
    Networking.fetchHotComments();
    Networking.fetchHotHelps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("动态"),
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.white,
          controller: controller,
          tabs: <Widget>[
            Tab(
              text: "热门评论",
            ),
            Tab(
              text: "会员求助",
            ),
          ],
        ),
      ),
      body: Container(
        child: TabBarView(
          controller: controller,
          children: <Widget>[
            HotCommentList(),
            StoreConnector<ReduxState, DynamicViewModel>(
                converter: (store) => DynamicViewModel(store),
                builder: (context, vm) {
                  return HelpListView(
                    helps: vm.helps,
                  );
                })
          ],
        ),
      ),
    );
  }
}
