import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yyets/api/api.dart';
import 'package:yyets/models/article.dart';
import 'package:yyets/pages/search.dart';
import 'package:yyets/redux/states/main.dart';
import 'package:yyets/redux/view_models/home.dart';
import 'package:yyets/widgets/main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sliderIndex = 0;
  @override
  void initState() {
    super.initState();
    Networking.fetchtSchedule();
    Networking.fetchArticles();
    Networking.fetchBanners();
    Networking.fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(),
      appBar: AppBar(
        elevation: 0.0,
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
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              child: Text(DateTime.now().day.toString()),
            ),
          ),
        ],
      ),
      body: StoreConnector<ReduxState, HomeViewModel>(
          converter: (store) => HomeViewModel(store),
          builder: (context, vm) {
            return Container(
                child: vm.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        child: ListView(
                          primary: true,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: vm.ads.isNotEmpty
                                  ? HomeBanner(
                                      banners: vm.ads,
                                    )
                                  : Container(),
                            ),
                            SectionTitle(
                              title: "今日播出",
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: vm.schedules.isNotEmpty
                                  ? TodaysBoardcast(
                                      schedules: vm.schedules,
                                    )
                                  : Container(),
                            ),
                            SectionDivider(),
                            vm.articles.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    itemCount: vm.articles.length,
                                    itemBuilder: (context, index) {
                                      return ArticleView(
                                        vm: ArticleViewModel
                                            .fromArticle(vm.articles[index]),
                                      );
                                    },
                                  )
                                : Container(),
                          ],
                        ),
                      ));
          }),
    );
  }
}
