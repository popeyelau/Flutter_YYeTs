import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yyets/api/api.dart';
import 'package:yyets/pages/search.dart';
import 'package:yyets/redux/states/main.dart';
import 'package:yyets/redux/view_models/rank.dart';
import 'package:yyets/widgets/main.dart';

class RankPage extends StatefulWidget {
  @override
  _RankPageState createState() => _RankPageState();
}

class _RankPageState extends State<RankPage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  final List<String> tabs = ["今日", "本月", "日剧", "电影", "新剧", "总榜"];
  @override
  void initState() {
    super.initState();
    controller = TabController(length: tabs.length, vsync: this);
    Networking.fetchTopRanks();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          child: SearchBar(
            enabled: false,
          ),
          onTap: () {
            Navigator
                .of(context)
                .push(MaterialPageRoute(builder: (context) => SearchPage()));
          },
        ),
        bottom: TabBar(
          controller: controller,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.white,
          tabs: tabs.map((title) => Tab(text: title)).toList(),
        ),
      ),
      body: Container(
        child: StoreConnector<ReduxState, RankViewModel>(
            converter: (store) => RankViewModel(store),
            builder: (context, vm) {
              return TabBarView(
                controller: controller,
                children: [
                  vm.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : VideoGridView(resources: vm.ranks.today),
                  VideoGridView(resources: vm.ranks?.month),
                  VideoGridView(resources: vm.ranks?.japan),
                  VideoGridView(resources: vm.ranks?.movie),
                  VideoGridView(resources: vm.ranks?.news),
                  VideoGridView(resources: vm.ranks?.total)
                ],
              );
            }),
      ),
    );
  }
}
