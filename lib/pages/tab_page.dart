import 'package:flutter/material.dart';
import 'package:yyets/pages/main.dart';
import 'package:yyets/widgets/main.dart';

class TabPage extends StatefulWidget {
  @override
  TabPageState createState() {
    return new TabPageState();
  }
}

class TabPageState extends State<TabPage> with TickerProviderStateMixin {
  TabController controller;
  int selectedIndex = 0;
  @override
  void initState() {
    controller = TabController(vsync: this, length: 4);
    controller.addListener(() {
      setState(() {
        selectedIndex = controller.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomePage(),
          RankPage(),
          LibPage(),
          DynamicPage(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.grey[100],
        child: TabBar(
          isScrollable: false,
          indicatorColor: Colors.transparent,
          controller: controller,
          tabs: <Widget>[
            TabBarItem(
              text: "首页",
              icon: Icons.home,
              selected: selectedIndex == 0,
            ),
            TabBarItem(
              text: "排行",
              icon: Icons.local_play,
              selected: selectedIndex == 1,
            ),
            TabBarItem(
              text: "片库",
              icon: Icons.ondemand_video,
              selected: selectedIndex == 2,
            ),
            TabBarItem(
              text: "动态",
              icon: Icons.camera,
              selected: selectedIndex == 3,
            )
          ],
        ),
      ),
    );
  }
}
